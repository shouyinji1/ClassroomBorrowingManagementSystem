package dao;

import java.util.List;

import entity.Application;
import entity.RoomStatus;

public interface NormalUserDao {
	/** 查询某用户的所有申请表 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询某张申请表的相关信息 */
	public Application getApplicationById(int id);
	
	/** 查询与申请时间相似的教室状态 */
	public List<RoomStatus> getRoomsStatusByApplication(Application application);

	/** 查询与申请时间相似的申请记录 */
	public List<Application> getApplicationsByApplication(Application application);
	
	/** 更新申请表记录 */
	public void updateApplication(Application application);
}