package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.AdminDao;
import entity.Application;

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
}
