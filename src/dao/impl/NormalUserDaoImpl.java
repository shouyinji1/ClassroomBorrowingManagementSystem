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
	public List<Application> getApplicationsById(String userID) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsById(userID);
	}
}
