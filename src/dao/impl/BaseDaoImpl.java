package dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entity.User;

@Repository
public class BaseDaoImpl<T> {
	// 1. 声明SqlSessionFactory
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	// 2. 声明SqlSession
	protected SqlSession sqlSession;
	// 3. 声明mapper属性
	private Class<T> mapper;
	
	// 4. 为mapper创建get set
	public T getMapper() {
		return sqlSessionFactory.openSession().getMapper(mapper);
	}
	public void setMapper(Class<T> mapper) {
		this.mapper=mapper;
	}
}
