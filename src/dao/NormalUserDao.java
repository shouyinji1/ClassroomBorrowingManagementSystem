package dao;

import java.util.List;

import entity.Application;

public interface NormalUserDao {
	/** 查询某用户的所有申请表 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询某张申请表的相关信息 */
	public Application getApplicationById(int id);
}