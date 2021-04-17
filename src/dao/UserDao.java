package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface UserDao {
	/** 查询所有用户 */
	public List<User> getAllUser();
	/** 根据用户ID查询该用户所有信息 */
	public List<User> getUserById(String id);
	
	/** 更新用户个人信息 */
	public int updUser(User user);
	/** 根据用户名和密码查询用户信息 */
	public User getUserByIdAndPassword(@Param("id")String id, @Param("password")String password);
	
	public int updatePassword(User user);
}
