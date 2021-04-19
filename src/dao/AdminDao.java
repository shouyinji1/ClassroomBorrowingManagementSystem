package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Application;
import entity.Classroom;

public interface AdminDao {
	/** 查询没有过期的申请 */
	public List<Application> getApplicationsForApproval(@Param("zhouCiNow")int zhouCiNow,
			@Param("xingQiNow")int xingQiNow);

	/** 查询某张申请表的相关信息 */
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
	public List<Application> getApplicationsByRoom(Classroom room);
	
	/** 查询7天内的已审批记录 */
	public List<Application> getReviewedApplicationsOf7Days();
	
	
	
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
}
