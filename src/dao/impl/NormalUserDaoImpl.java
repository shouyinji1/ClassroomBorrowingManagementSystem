package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.NormalUserDao;
import entity.Application;

@Repository
public class NormalUserDaoImpl extends BaseDaoImpl<NormalUserDao> implements NormalUserDao {
	// 构造函数调用父类的构造方法
	public NormalUserDaoImpl() {
		// TODO Auto-generated constructor stub
		super();
		this.setMapper(NormalUserDao.class);
	}

	@Override
	public List<Application> getApplicationsByUserId(String userID) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsByUserId(userID);
	}

	@Override
	public Application getApplicationById(int id) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationById(id);
	}
}
