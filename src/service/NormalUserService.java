package service;

import java.util.List;

import entity.Application;
import entity.RoomStatus;

public interface NormalUserService {
	/** 查询某一用户的所有申请记录 */
	public List<Application> getApplicationsByUserId(String userID);
	
	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);
	
	/** 更新申请表 */
	public int updateApplication(Application application);
	
	/** 查询所有校区 */
	public List<String> getAllXiaoQu();
	
	/** 根据校区查询所有的教学楼 */
	public List<String> getAllJiaoXueLouByXiaoQu(String xiaoQu);
	
	/** 根据校区、教学楼查询所有的楼层 */
	public List<String> getAllTypeByXiaoquJiaoxuelou(String xiaoQu,String jiaoXueLou);
}
