package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.NormalUserDao;
import entity.Application;
import entity.RoomStatus;
import entity.Semester;

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

	@Override
	public void updateApplication(Application application) {
		// TODO Auto-generated method stub
		this.getMapper().updateApplication(application);
	}

	@Override
	public List<RoomStatus> getRoomsStatusByApplication(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomsStatusByApplication(application);
	}

	@Override
	public List<Application> getApplicationsByApplication(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsByApplication(application);
	}

	@Override
	public List<String> getAllXiaoQu() {
		// TODO Auto-generated method stub
		return this.getMapper().getAllXiaoQu();
	}

	@Override
	public List<String> getAllJiaoXueLouByXiaoQu(String xiaoQu) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllJiaoXueLouByXiaoQu(xiaoQu);
	}

	@Override
	public List<String> getAllTypeByXiaoquJiaoxuelou(String xiaoQu, String jiaoXueLou) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllTypeByXiaoquJiaoxuelou(xiaoQu, jiaoXueLou);
	}

	@Override
	public List<String> getAllTypeByXJT(String xiaoQu, String jiaoXueLou, String type) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllTypeByXJT(xiaoQu, jiaoXueLou, type);
	}

	@Override
	public List<String> getAllTypeByXJTF(String xiaoQu, String jiaoXueLou, String type, String floor) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllTypeByXJTF(xiaoQu, jiaoXueLou, type, floor);
	}

	@Override
	public List<Semester> getSemesters() {
		// TODO Auto-generated method stub
		return this.getMapper().getSemesters();
	}
}
