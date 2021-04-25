package service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;

public interface NormalUserService {
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);
	
	/** 更新申请表 */
	public int updateApplication(Application application);
	
	/** 根据申请记录ID删除指定申请记录 */
	public int deleteApplicationById(int id);

	/** 根据查询条件查询教室信息 */
	public List<String> getAllXiaoQu();
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu);
	public List<String> getAllJiaoXueLouByXJ(String xiaoQu, String jiaoXueQu);
	public List<String> getAllTypeByXJJ(String xiaoQu, String jiaoXueQu, String jiaoXueLou);
	public List<String> getAllFloorByXJJT(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type);
	public List<String> getAllRoomIDByXJJTF(String xiaoQu, String jiaoXueQu, String jiaoXueLou, String type,
			String floor);
	
	/** 查询符合查询条件的空闲教室 */
	public List<Classroom> getRoomsByApply(Application application);
	
	/** 根据教室ID查询教室信息 */
	public Classroom getClassroomById(String id);
	
	/** 插入申请记录 */
	public int insertApplication(Application application);

	/** 更新反馈 */
	public int updateFeedback(Application application);

	/** 获取某教室的所有用户反馈记录 */
	public List<Application> getFeedbacksByRoomID(String roomID);
	
	/** 获取某教室某一周的使用 */
	public String[][][] getRoomArrangeByRoomIDAndZhouCi(Application application);
}
