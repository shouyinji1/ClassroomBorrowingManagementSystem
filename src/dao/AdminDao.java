package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Application;

public interface AdminDao {
	/** 查询没有过期的申请 */
	public List<Application> getApplicationsForApproval(@Param("zhouCiNow")int zhouCiNow,
			@Param("xingQiNow")int xingQiNow);

	/** 查询某张申请表的相关信息 */
	public Application getApplicationById(int id);
	
	/** 添加审批意见 */
	public int updateReviewOfApplication(Application application);
}
