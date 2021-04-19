package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.AdminDao;
import entity.Application;
import entity.Classroom;

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
}
