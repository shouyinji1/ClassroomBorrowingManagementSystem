package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.AdminDao;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;

@Repository
public class AdminDaoImpl extends BaseDaoImpl<AdminDao> implements AdminDao {
	// 构造函数调用父类的构造方法
	public AdminDaoImpl() {
		// TODO Auto-generated constructor stub
		super();
		this.setMapper(AdminDao.class);
	}

	@Override
	public List<Application> getApplicationsForApproval(int zhouCiNow,int xingQiNow) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsForApproval(zhouCiNow,xingQiNow);
	}

	@Override
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationById(id);
	}

	@Override
	public int updateReviewOfApplication(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().updateReviewOfApplication(application);
	}

	@Override
	public List<String> getAllXiaoQuOfApplications() {
		// TODO Auto-generated method stub
		return this.getMapper().getAllXiaoQuOfApplications();
	}

	@Override
	public List<String> getJiaoXueQuOfAByX(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getJiaoXueQuOfAByX(room);
	}

	@Override
	public List<String> getJiaoXueLouOfAByXJ(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getJiaoXueLouOfAByXJ(room);
	}

	@Override
	public List<String> getTypeOfAByXJJ(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getTypeOfAByXJJ(room);
	}

	@Override
	public List<String> getFloorOfAByXJJT(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getFloorOfAByXJJT(room);
	}

	@Override
	public List<String> getRoomIDOfAByXJJTF(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomIDOfAByXJJTF(room);
	}

	@Override
	public List<Application> getApplicationsByRoom(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsByRoom(room);
	}

	@Override
	public List<Application> getReviewedApplicationsOf7Days() {
		// TODO Auto-generated method stub
		return this.getMapper().getReviewedApplicationsOf7Days();
	}

	@Override
	public int updateReadFeedback(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().updateReadFeedback(application);
	}

	@Override
	public List<String> getAllXiaoQu() {
		// TODO Auto-generated method stub
		return this.getMapper().getAllXiaoQu();
	}

	@Override
	public List<String> getAllJiaoXueQuByXiaoQu(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllJiaoXueQuByXiaoQu(room);
	}

	@Override
	public List<String> getAllJiaoXueLouByXJ(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllJiaoXueLouByXJ(room);
	}

	@Override
	public List<String> getAllTypeByXJJ(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllTypeByXJJ(room);
	}

	@Override
	public List<String> getAllFloorByXJJT(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllFloorByXJJT(room);
	}

	@Override
	public List<String> getAllRoomIDByXJJTF(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllRoomIDByXJJTF(room);
	}

	@Override
	public List<Classroom> getRoomsByRoomInfo(Classroom room) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomsByRoomInfo(room);
	}

	@Override
	public List<Application> getApplicationsByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsByRoomID(roomID);
	}

	@Override
	public List<RoomSchedule> getRoomSchedulesByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomSchedulesByRoomID(roomID);
	}

	@Override
	public List<Application> getUnreadFeedbacks() {
		// TODO Auto-generated method stub
		return this.getMapper().getUnreadFeedbacks();
	}

	@Override
	public List<Application> getFeedbacksRecent7Days() {
		// TODO Auto-generated method stub
		return this.getMapper().getFeedbacksRecent7Days();
	}

	@Override
	public int getCounterOfNewFeedback() {
		// TODO Auto-generated method stub
		return this.getMapper().getCounterOfNewFeedback();
	}
}
