package service.impl;

import java.util.List;

import org.apache.logging.log4j.core.config.AppendersPlugin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.method.annotation.SessionStatusMethodArgumentResolver;

import dao.NormalUserDao;
import dao.UserDao;
import dao.impl.UserDaoImpl;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;
import service.NormalUserService;

@Service("normalUserService")
public class NormalUserServiceImpl implements NormalUserService {
	@Autowired
	NormalUserDao normalUserDao;
	@Autowired
	UserDao userDao;

	@Override
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID) {
		// TODO Auto-generated method stub
		List<Application> applications=normalUserDao.getApplicationsByUserId(userID);
		
		// 设置申请记录的状态
		Semester semester=userDao.getSemesters().get(0);
		for(Application application:applications) {
			application.setStatus(semester);
		}
		return applications;
	}
	
	@Override
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		Application application =normalUserDao.getApplicationById(id);
		// 设置申请记录的状态
		application.setStatus(userDao.getSemesters().get(0));
		return application;
	}

	@Override
	/** 更新申请信息
	 * @return 0:更新成功，1:与已有教室安排冲突，2:与已有申请记录冲突
	 *  */
	public int updateApplication(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.updateApplication(application);
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

	@Override
	public int updateFeedback(Application application) {
		// TODO Auto-generated method stub
		return normalUserDao.updateFeedback(application);
	}

	@Override
	public List<Application> getFeedbacksByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return normalUserDao.getFeedbacksByRoomID(roomID);
	}
}
