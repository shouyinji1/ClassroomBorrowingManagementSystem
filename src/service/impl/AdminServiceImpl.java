package service.impl;

import java.awt.datatransfer.FlavorListener;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminDao;
import dao.UserDao;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;
import service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDao adminDao;
	@Autowired
	UserDao userDao;

	@Override
	public List<Application> getApplicationsForApproval() {
		// TODO Auto-generated method stub
		Semester semester=userDao.getSemesters().get(0);
		return adminDao.getApplicationsForApproval(semester.getZhouCiNow(),semester.getXingQiNow());
	}

	@Override
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		Application application =adminDao.getApplicationById(id);
		// 设置申请是否过期
		application.setStatus(userDao.getSemesters().get(0));
		return application;
	}

	@Override
	public int updateReviewOfApplication(Application application) {
		// TODO Auto-generated method stub
		application.setReviewTime(new Date());
		return adminDao.updateReviewOfApplication(application);
	}

	@Override
	public List<String> getAllXiaoQuOfApplications() {
		// TODO Auto-generated method stub
		return adminDao.getAllXiaoQuOfApplications();
	}

	@Override
	public List<String> getJiaoXueQuOfAByX(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getJiaoXueQuOfAByX(room);
	}

	@Override
	public List<String> getJiaoXueLouOfAByXJ(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getJiaoXueLouOfAByXJ(room);
	}

	@Override
	public List<String> getTypeOfAByXJJ(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getTypeOfAByXJJ(room);
	}

	@Override
	public List<String> getFloorOfAByXJJT(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getFloorOfAByXJJT(room);
	}

	@Override
	public List<String> getRoomIDOfAByXJJTF(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getRoomIDOfAByXJJTF(room);
	}

	@Override
	public List<Application> getApplicationsByRoom(Classroom room,int approval) {
		// TODO Auto-generated method stub
		List<Application> applications=adminDao.getApplicationsByRoom(room);
		String floor=room.getFloor();
		String roomID=room.getId();
		System.out.println(floor);
		System.out.println(roomID);
		if(floor !=null && !floor.equals("")) {
			for(int i=applications.size()-1;i>=0;i--) {
				if(!applications.get(i).getClassroom().getFloor().equals(floor))
					applications.remove(i);
			}
		}
		if(roomID !=null && !roomID.equals("")) {
			for(int i=applications.size()-1;i>=0;i--) {
				if(!applications.get(i).getRoomID().equals(roomID))
					applications.remove(i);
			}
		}
		if(approval==1 || approval==0) {
			boolean approvalB;
			if(approval==1)
				approvalB=true;
			else{
				approvalB=false;
			}
			for(int i=applications.size()-1;i>=0;i--) {
				if(!applications.get(i).getApproval()==approvalB)
					applications.remove(i);
			}
		}
		for(Application application:applications) {
			application.setStatus(userDao.getSemesters().get(0));
		}
		return applications;
	}

	@Override
	public List<Application> getReviewedApplicationsOf7Days() {
		// TODO Auto-generated method stub
		List<Application> applications= adminDao.getReviewedApplicationsOf7Days();
		for(Application application:applications) {
			application.setStatus(userDao.getSemesters().get(0));
		}
		return applications;
	}

	@Override
	public List<String> getAllXiaoQu() {
		// TODO Auto-generated method stub
		return adminDao.getAllXiaoQu();
	}

	@Override
	public List<String> getAllJiaoXueQuByXiaoQu(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getAllJiaoXueQuByXiaoQu(room);
	}

	@Override
	public List<String> getAllJiaoXueLouByXJ(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getAllJiaoXueLouByXJ(room);
	}

	@Override
	public List<String> getAllTypeByXJJ(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getAllTypeByXJJ(room);
	}

	@Override
	public List<String> getAllFloorByXJJT(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getAllFloorByXJJT(room);
	}

	@Override
	public List<String> getAllRoomIDByXJJTF(Classroom room) {
		// TODO Auto-generated method stub
		return adminDao.getAllRoomIDByXJJTF(room);
	}

	@Override
	public int updateReadFeedback(Application application) {
		// TODO Auto-generated method stub
		return adminDao.updateReadFeedback(application);
	}

	@Override
	public List<Classroom> getRoomsByRoomInfo(Classroom room) {
		// TODO Auto-generated method stub
		List<Classroom> rooms= adminDao.getRoomsByRoomInfo(room);
		String floor=room.getFloor();
		String roomID=room.getId();
		if (floor !=null && !floor.equals("")) {
			for(int i=rooms.size()-1;i>=0;i--) {
				if (!rooms.get(i).getFloor().equals(floor)) {
					rooms.remove(i);
				}
			}
		}
		if (roomID !=null && !roomID.equals("")) {
			for(int i=rooms.size()-1;i>=0;i--) {
				if (!rooms.get(i).getId().equals(roomID)) {
					rooms.remove(i);
				}
			}
		}
		return rooms;
	}

	@Override
	public List<Application> getApplicationsByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return adminDao.getApplicationsByRoomID(roomID);
	}

	@Override
	public List<RoomSchedule> getRoomSchedulesByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return adminDao.getRoomSchedulesByRoomID(roomID);
	}

	@Override
	public List<Application> getUnreadFeedbacks() {
		// TODO Auto-generated method stub
		return adminDao.getUnreadFeedbacks();
	}

	@Override
	public List<Application> getFeedbacksRecent7Days() {
		// TODO Auto-generated method stub
		return adminDao.getFeedbacksRecent7Days();
	}

	@Override
	public int getCounterOfNewFeedback() {
		// TODO Auto-generated method stub
		return adminDao.getCounterOfNewFeedback();
	}
}
