package service;

import java.util.List;
import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;

public interface AdminService {
	/** 查询没有过期的申请 */
	public List<Application> getApplicationsForApproval();

	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);

	/** 添加审批意见 */
	public int updateReviewOfApplication(Application application);
	
	/** 查询有被申请的所有校区 */
	public List<String > getAllXiaoQuOfApplications();

	/** 根据申请表中的校区查找所有教学区 */
	public List<String> getJiaoXueQuOfAByX(Classroom room);
	public List<String> getJiaoXueLouOfAByXJ(Classroom room);
	public List<String> getTypeOfAByXJJ(Classroom room);
	public List<String> getFloorOfAByXJJT(Classroom room);
	public List<String> getRoomIDOfAByXJJTF(Classroom room);

	/** 根据教室查询申请记录 */
	public List<Application> getApplicationsByRoom(Classroom room,int approval);

	/** 查询7天内的已审批记录 */
	public List<Application> getReviewedApplicationsOf7Days();
	
	/** 更新反馈已读标志 */
	public int updateReadFeedback(Application application);

	/** 查询所有校区 */
	public List<String> getAllXiaoQu();
	/** 根据校区查询所有教学区 */
	public List<String> getAllJiaoXueQuByXiaoQu(Classroom room);
	/** 根据校区、教学区查询所有教学楼 */
	public List<String> getAllJiaoXueLouByXJ(Classroom room);
	/** 根据校区、教学区、教学楼查询所有类型 */
	public List<String> getAllTypeByXJJ(Classroom room);
	/** 根据校区、教学区、教学楼、类型查询所有楼层 */
	public List<String> getAllFloorByXJJT(Classroom room);
	/** 根据校区、教学楼、类型、楼层查询所有教室 */
	public List<String> getAllRoomIDByXJJTF(Classroom room);
	
	/** 根据教室筛选条件查询教室 */
	public List<Classroom> getRoomsByRoomInfo(Classroom room);

	/** 根据教室ID查询所有申请信息 */
	public List<Application> getApplicationsByRoomID(String roomID);

	/** 根据教室ID查询所有课程安排 */
	public List<RoomSchedule> getRoomSchedulesByRoomID(String roomID);
	
	/** 查询所有未读反馈 */
	public List<Application> getUnreadFeedbacks();
	
	/** 查询最近七天的反馈 */
	public List<Application> getFeedbacksRecent7Days();

	/** 查询新反馈的个数 */
	public int getCounterOfNewFeedback();

	/** 更新学期信息 */
	public int updateSemester(Semester semester);
}
