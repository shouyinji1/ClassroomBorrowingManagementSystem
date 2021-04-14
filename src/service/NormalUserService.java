package service;

import java.util.List;

import entity.Application;
import entity.Classroom;
import entity.Semester;

public interface NormalUserService {
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);
	
	/** 更新申请表 */
	public int updateApplication(Application application);
	
	/** 根据查询条件查询教室信息 */
	public List<String> getAllXiaoQu();
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu);
	public List<String> getAllJiaoXueLouByXJ(String xiaoQu, String jiaoXueQu);
	public List<String> getAllTypeByXJJ(String xiaoQu, String jiaoXueQu, String jiaoXueLou);
	public List<String> getAllFloorByXJJT(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type);
	public List<String> getAllRoomIDByXJJTF(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type,
			String floor);
	
	/** 查询学期信息 */
	public List<Semester> getSemesters();
	
	/** 查询符合查询条件的空闲教室 */
	public List<Classroom> getRoomsByApply(Application application);
	
	/** 根据教室ID查询教室信息 */
	public Classroom getClassroomById(String id);
	
}
