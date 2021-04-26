package dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDaoImpl<T> extends SqlSessionDaoSupport{
	// 1. 声明SqlSessionFactory
	//@Autowired
	//private SqlSessionFactory sqlSessionFactory;
	// 2. 声明SqlSession
	//@Autowired
	//protected SqlSession sqlSession;
	// 3. 声明mapper属性
	private Class<T> mapper;
	
	@Override
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	// 4. 为mapper创建get set
	//@Autowired
	public T getMapper() {
		return getSqlSession().getMapper(mapper);
		//return sqlSessionFactory.openSession().getMapper(mapper);
		//return sqlSession.getMapper(mapper);
	}
	public void setMapper(Class<T> mapper) {
		this.mapper=mapper;
	}
}
