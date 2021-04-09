package dao;

import java.util.List;

import entity.Application;

public interface NormalUserDao {
	public List<Application> getApplicationsById(String userID);
}