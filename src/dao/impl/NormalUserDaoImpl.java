package dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import dao.NormalUserDao;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
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
	public int updateApplication(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().updateApplication(application);
	}

	@Override
	public int deleteApplicationById(int id) {
		// TODO Auto-generated method stub
		return this.getMapper().deleteApplicationById(id);
	}

	@Override
	public List<RoomSchedule> getRoomSchedulesByApplication(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomSchedulesByApplication(application);
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
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllJiaoXueQuByXiaoQu(xiaoQu);
	}

	@Override
	public List<String> getAllJiaoXueLouByXJ(String xiaoQu, String jiaoXueQu) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllJiaoXueLouByXJ(xiaoQu, jiaoXueQu);
	}

	@Override
	public List<String> getAllTypeByXJJ(String xiaoQu, String jiaoXueQu, String jiaoXueLou) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllTypeByXJJ(xiaoQu, jiaoXueQu, jiaoXueLou);
	}

	@Override
	public List<String> getAllFloorByXJJT(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllFloorByXJJT(xiaoQu, jiaoXueQu, jiaoXueLou, type);
	}

	@Override
	public List<String> getAllRoomIDByXJJTF(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type,
			String floor) {
		// TODO Auto-generated method stub
		return this.getMapper().getAllRoomIDByXJJTF(xiaoQu, jiaoXueQu, jiaoXueLou, type, floor);
	}

	@Override
	public List<Classroom> getRoomsByApply(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomsByApply(application);
	}

	@Override
	public Classroom getClassroomById(String id) {
		// TODO Auto-generated method stub
		return this.getMapper().getClassroomById(id);
	}

	@Override
	public int insertApplication(Application application) {
		// TODO Auto-generated method stub
		return getMapper().insertApplication(application);
	}

	/** 更新反馈 */
	@Override
	public int updateFeedback(Application application) {
		return getMapper().updateFeedback(application);
	}

	@Override
	public List<Application> getFeedbacksByRoomID(String roomID) {
		// TODO Auto-generated method stub
		return getMapper().getFeedbacksByRoomID(roomID);
	}

	@Override
	public List<Application> getApplicationsByRoomIDAndZhouCi(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getApplicationsByRoomIDAndZhouCi(application);
	}

	@Override
	public List<RoomSchedule> getRoomSchedulesByRoomIDAndZhouCi(Application application) {
		// TODO Auto-generated method stub
		return this.getMapper().getRoomSchedulesByRoomIDAndZhouCi(application);
	}
}
