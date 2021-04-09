package service;

import java.util.List;

import entity.Application;

public interface NormalUserService {
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsById(String userID);
}
