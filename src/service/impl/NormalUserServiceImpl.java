package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NormalUserDao;
import entity.Application;
import entity.RoomStatus;
import service.NormalUserService;

@Service("normalUserService")
public class NormalUserServiceImpl implements NormalUserService {
	@Autowired
	NormalUserDao normalUserDao;

	@Override
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID) {
		// TODO Auto-generated method stub
		return normalUserDao.getApplicationsByUserId(userID);
	}
	
	@Override
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		return normalUserDao.getApplicationById(id);
	}

	@Override
	/** 更新申请信息
	 * @return 0:更新成功，1:与已有教室安排冲突，2:与已有申请记录冲突
	 *  */
	public int updateApplication(Application application) {
		// TODO Auto-generated method stub
		// 判断教室借用时段是否与已存在教室安排冲突
		List<RoomStatus> roomsStatus=normalUserDao.getRoomsStatusByApplication(application);
		for(RoomStatus roomStatus:roomsStatus) {	
			if(roomStatus.getsJieCi()>=application.getsJieCi() && roomStatus.getsJieCi()<=application.geteJieCi()) {
				return 1;
			}else if(application.getsJieCi()>=roomStatus.getsJieCi() && application.getsJieCi()<=roomStatus.geteJieCi()) {
				return 1;
			}
		}
		// 判断教室借用时段是否和已存在申请记录冲突
		List<Application> similarApplications=normalUserDao.getApplicationsByApplication(application);
		for(Application similarApplication:similarApplications) {
			if(similarApplication.getId() != application.getId()) {
				if(similarApplication.getsJieCi()>=application.getsJieCi()
						&& similarApplication.getsJieCi()<=application.geteJieCi()) {
					return 2;
				}else if(application.getsJieCi()>=similarApplication.getsJieCi()
						&& application.getsJieCi()<=similarApplication.geteJieCi()) {
					return 2;
				}
			}
		}
		normalUserDao.updateApplication(application);
		return 0;
	}
}
