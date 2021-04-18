package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.UserDao;
import entity.Semester;
import entity.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<UserDao> implements UserDao{
	// 构造函数调用父类的构造方法
	public UserDaoImpl() {
		super();
		this.setMapper(UserDao.class);
	}
	// 查询所有用户
	@Override
	public List<User> getAllUser(){
		return this.getMapper().getAllUser();
	}
	// 根据用户ID查询用户信息
	@Override
	public List<User> getUserById(String id){
		return this.getMapper().getUserById(id);
	}
	// 修改用户信息
	@Override
	public int updUser(User user) {
		return this.getMapper().updUser(user);
	}
	// 删除用户
	public void delUser(int uId) {
		
	}
	
	@Override
	public User getUserByIdAndPassword(String id, String password){
		return this.getMapper().getUserByIdAndPassword(id, password);
	}
	@Override
	public int updatePassword(User user) {
		// TODO Auto-generated method stub
		return this.getMapper().updatePassword(user);
	}

	@Override
	public List<Semester> getSemesters() {
		// TODO Auto-generated method stub
		return this.getMapper().getSemesters();
	}
}
