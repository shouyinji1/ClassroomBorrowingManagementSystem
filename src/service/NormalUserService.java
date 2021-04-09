package service;

import java.util.List;

import entity.Application;

public interface NormalUserService {
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);
}
