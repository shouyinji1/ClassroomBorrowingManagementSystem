package service;

import java.util.List;
import entity.Application;

public interface AdminService {
	/** 查询没有过期的申请 */
	public List<Application> getApplicationsForApproval();

	/** 查询指定申请记录的所有信息 */
	public Application getApplicationById(int id);

	/** 添加审批意见 */
	public int updateReviewOfApplication(Application application);
}
