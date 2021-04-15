package service.impl;

import java.util.List;

import org.apache.logging.log4j.core.config.AppendersPlugin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.annotation.SessionStatusMethodArgumentResolver;

import dao.NormalUserDao;
import entity.Application;
import entity.Classroom;
import entity.RoomStatus;
import entity.Semester;
import service.NormalUserService;

@Service("normalUserService")
public class NormalUserServiceImpl implements NormalUserService {
	@Autowired
	NormalUserDao normalUserDao;

	@Override
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID) {
		// TODO Auto-generated method stub
		List<Application> applications=normalUserDao.getApplicationsByUserId(userID);
		
		// 设置申请是否过期
		Semester semester=normalUserDao.getSemesters().get(0);
		for(Application application:applications) {
			application.setAging(semester);
		}
		return applications;
	}
	
	@Override
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		Application application =normalUserDao.getApplicationById(id);
		// 设置申请是否过期
		Semester semester=normalUserDao.getSemesters().get(0);
		application.setAging(semester);
		return application;
	}

	@Override
	/** 更新申请信息
	 * @return 0:更新成功，1:与已有教室安排冲突，2:与已有申请记录冲突
	 *  */
	public int updateApplication(Application application) {
		// TODO Auto-generated method stub
		// 判断教室借用时段是否与已存在教室安排冲突
		/*
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
		}*/
		return normalUserDao.updateApplication(application);
		//return 0;
	}

	@Override
	public int deleteApplicationById(int id) {
		// TODO Auto-generated method stub
		return normalUserDao.deleteApplicationById(id);
	}

	@Override
	public List<String> getAllXiaoQu() {
		// TODO Auto-generated method stub
		return normalUserDao.getAllXiaoQu();
	}

	@Override
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllJiaoXueQuByXiaoQu(xiaoQu);
	}

	@Override
	public List<String> getAllJiaoXueLouByXJ(String xiaoQu, String jiaoXueQu) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllJiaoXueLouByXJ(xiaoQu, jiaoXueQu);
	}

	@Override
	public List<String> getAllTypeByXJJ(String xiaoQu, String jiaoXueQu, String jiaoXueLou) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllTypeByXJJ(xiaoQu, jiaoXueQu, jiaoXueLou);
	}

	@Override
	public List<String> getAllFloorByXJJT(String xiaoQu, String jiaoXueQu,
			String jiaoXueLou,String type) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllFloorByXJJT(xiaoQu, jiaoXueQu, jiaoXueLou, type);
	}

	@Override
	public List<String> getAllRoomIDByXJJTF(String xiaoQu, String jiaoXueQu, String jiaoXueLou,
			String type,String floor) {
		// TODO Auto-generated method stub
		return normalUserDao.getAllRoomIDByXJJTF(xiaoQu, jiaoXueQu, jiaoXueLou, type, floor);
	}

	@Override
	public List<Semester> getSemesters() {
		// TODO Auto-generated method stub
		return normalUserDao.getSemesters();
	}

	@Override
	public List<Classroom> getRoomsByApply(Application application) {
		// TODO Auto-generated method stub
		List<Classroom> rooms=normalUserDao.getRoomsByApply(application);
		String floor=application.getClassroom().getFloor();
		String roomID=application.getRoomID();
		String capacity=application.getClassroom().getCapacity();
		if(floor !=null && !floor.equals("")) {
			floor=floor.trim();
			for(int i=rooms.size()-1;i>=0;i--) {
				if(!rooms.get(i).getFloor().equals(floor)) {
					rooms.remove(i);
				}
			}
		}
		if(roomID !=null && !roomID.equals("")) {
			roomID=roomID.trim();
			for(int i=rooms.size()-1;i>=0;i--) {
				if(!rooms.get(i).getId().trim().equals(roomID))
					rooms.remove(i);
			}
		}
		if(capacity!=null && !capacity.equals("")) {
			int cap=Integer.parseInt(capacity);
			for(int i=rooms.size()-1;i>=0;i--) {
				if(Integer.parseInt(rooms.get(i).getCapacity())<cap)
					rooms.remove(i);
			}
		}
		return rooms;
	}

	@Override
	public Classroom getClassroomById(String id) {
		// TODO Auto-generated method stub
		return normalUserDao.getClassroomById(id);
	}

	@Override
	public int insertApplication(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.insertApplication(application);
	}

}
