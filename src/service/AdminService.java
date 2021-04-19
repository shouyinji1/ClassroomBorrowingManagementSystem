package service;

import java.util.List;
import entity.Application;
import entity.Classroom;

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
}
