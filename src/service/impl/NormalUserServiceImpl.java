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
	public List<Application> getApplicationsById(String userID) {
		// TODO Auto-generated method stub
		return normalUserDao.getApplicationsById(userID);
	}
}
