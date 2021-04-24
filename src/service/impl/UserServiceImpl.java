package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.UserDao;
import entity.Semester;
import entity.User;
import service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	public List<User> getAllUser(){
		return userDao.getAllUser();
	}
	
	@Override
	public List<User> getUserById(String id){
		return userDao.getUserById(id);
	}
	
	@Override
	public int updUser(User user) {
		return userDao.updUser(user);
	}
	
	@Override
	public User login(String id,String password) {
		return userDao.getUserByIdAndPassword(id, password);
	}

	@Override
	public int updatePasssword(User user) {
		// TODO Auto-generated method stub
		return userDao.updatePassword(user);
	}

	@Override
	public List<Semester> getSemesters() {
		// TODO Auto-generated method stub
		return userDao.getSemesters();
	}

	@Override
	public int insertSemester() {
		// TODO Auto-generated method stub
		return userDao.insertSemester();
	}
}