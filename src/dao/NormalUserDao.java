package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Application;
import entity.Classroom;
import entity.RoomSchedule;
import entity.Semester;

public interface NormalUserDao {
	/** 查询某用户的所有申请表 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询某张申请表的相关信息 */
	public Application getApplicationById(int id);
	
	/** 查询与申请时间相似的教室状态 */
	public List<RoomSchedule> getRoomSchedulesByApplication(Application application);

	/** 查询与申请时间相似的申请记录 */
	public List<Application> getApplicationsByApplication(Application application);
	
	/** 更新申请表记录 */
	public int updateApplication(Application application);
	
	/** 根据申请记录ID删除指定申请记录 */
	public int deleteApplicationById(int id);
	
	/** 查询所有校区 */
	public List<String> getAllXiaoQu();
	
	/** 根据校区查询所有教学区 */
	public List<String> getAllJiaoXueQuByXiaoQu(String xiaoQu);
	
	/** 根据校区、教学区查询所有教学楼 */
	public List<String> getAllJiaoXueLouByXJ(@Param("xiaoQu")String xiaoQu,
			@Param("jiaoXueQu")String jiaoXueQu);

	/** 根据校区、教学区、教学楼查询所有类型 */
	public List<String> getAllTypeByXJJ(@Param("xiaoQu")String xiaoQu,
			@Param("jiaoXueQu")String jiaoXueQu,
			@Param("jiaoXueLou")String jiaoXueLou);
	
	/** 根据校区、教学区、教学楼、类型查询所有楼层 */
	public List<String> getAllFloorByXJJT(@Param("xiaoQu")String xiaoQu,
			@Param("jiaoXueQu")String jiaoXueQu,
			@Param("jiaoXueLou")String jiaoXueLou,
			@Param("type")String type);

	/** 根据校区、教学楼、类型、楼层查询所有教室 */
	public List<String> getAllRoomIDByXJJTF(@Param("xiaoQu")String xiaoQu,
			@Param("jiaoXueQu")String jiaoXueQu,
			@Param("jiaoXueLou")String jiaoXueLou,
			@Param("type")String type,
			@Param("floor")String floor);
	
	/** 查询符合查询条件的空闲教室 */
	public List<Classroom> getRoomsByApply(Application application);
	
	/** 根据教室ID查询教室信息 */
	public Classroom getClassroomById(String id);
	
	/** 插入申请记录 */
	public int insertApplication(Application application);
}