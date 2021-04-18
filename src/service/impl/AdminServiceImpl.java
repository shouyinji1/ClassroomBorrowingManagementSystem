package service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.AdminDao;
import dao.UserDao;
import entity.Application;
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
		Semester semester=userDao.getSemesters().get(0);
		application.setAging(semester);
		return application;
	}

	@Override
	public int updateReviewOfApplication(Application application) {
		// TODO Auto-generated method stub
		application.setReviewTime(new Date());
		return adminDao.updateReviewOfApplication(application);
	}
}
