package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.NormalUserDao;
import entity.Application;
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
}
