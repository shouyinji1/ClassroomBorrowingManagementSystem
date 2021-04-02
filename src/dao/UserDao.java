package dao;

import java.util.List;

import entity.User;

public interface UserDao {
	/** 查询所有用户 */
	public List<User> getAllUser();
	/** 根据用户ID查询该用户所有信息 */
	public List<User> getUserById(String id);
	public void updUser(User user);
}
