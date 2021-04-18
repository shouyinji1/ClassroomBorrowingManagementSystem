package service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import entity.Semester;
import entity.User;

public interface UserService {
	public List<User> getAllUser();
	/** 根据用户ID查询该用户所有信息 */
	public List<User> getUserById(String id);
	public int updUser(User user);
	public User login(String id,String password);
	
	/** 更新用户密码 */
	public int updatePasssword(User user);

	/** 查询学期信息 */
	public List<Semester> getSemesters();
}
