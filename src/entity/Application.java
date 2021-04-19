package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.stereotype.Component;

/** 教室申请表 */
@Component("application")
public class Application implements Serializable{
	private static final long serialVersionUID = 1L;

	/** 教室申请表ID */
	private int id;
	/** 申请者ID */
	private String userID;
	private String roomID;
	private Date submitTime;
	private int zhouCi;
	private int xingQi;
	private int sJieCi;
	private int eJieCi;
	private String type;
	private String purpose;
	private String reviewerID;
	private Date reviewTime;
	private Boolean approval;
	private String reviewContent;
	
	private User user;
	private Classroom classroom;
	private User reviewer;
	
	/** 所有的类型 */
	private String[] types= {"教学活动","会议","文娱活动","社团活动"};
	/** 申请状态
	 * 1：待审批，2：审批通过不可反馈，3：审批通过可反馈，4：审批不通过； 5：过期，6：教室不可用，*/
	private int status;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public Date getSubmitTime() {
		return submitTime;
	}
	/** 获取格式化的申请提交时间 */
	public String getFormatSubmitTime() {
        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间 
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
        return sdf.format(submitTime);	//获取当前时间
	}
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}
	public int getZhouCi() {
		return zhouCi;
	}
	public void setZhouCi(int zhouCi) {
		this.zhouCi = zhouCi;
	}
	public int getXingQi() {
		return xingQi;
	}
	public void setXingQi(int xingQi) {
		this.xingQi = xingQi;
	}
	public int getsJieCi() {
		return sJieCi;
	}
	public void setsJieCi(int sJieCi) {
		this.sJieCi = sJieCi;
	}
	public int geteJieCi() {
		return eJieCi;
	}
	public void seteJieCi(int eJieCi) {
		this.eJieCi = eJieCi;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getReviewerID() {
		return reviewerID;
	}
	public void setReviewerID(String reviewerID) {
		this.reviewerID = reviewerID;
	}
	public Date getReviewTime() {
		return reviewTime;
	}
	public String getFormatReviewTime() {
        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间 
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");
        return sdf.format(reviewTime);	//获取当前时间
	}
	public void setReviewTime(Date reviewTime) {
		this.reviewTime = reviewTime;
	}
	public Boolean getApproval() {
		return approval;
	}
	public void setApproval(Boolean approval) {
		this.approval = approval;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Classroom getClassroom() {
		return classroom;
	}
	public void setClassroom(Classroom classroom) {
		this.classroom = classroom;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public User getReviewer() {
		return reviewer;
	}
	public void setReviewer(User reviewer) {
		this.reviewer = reviewer;
	}
	public String[] getTypes() {
		return types;
	}
	public void setTypes(String[] types) {
		this.types = types;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(Semester semester) {
		int zhouCiNow=semester.getZhouCiNow();
		int xingQiNow=semester.getXingQiNow();
		if(approval==null) {	// 未审批
			if(zhouCi>zhouCiNow) {	// 未过期
				if(this.classroom.isAvailable()) {
					this.status=1;	// 待审核
				}else {
					this.status=6;	// 不可用
				}
			}else if(zhouCi==zhouCiNow) {
				if(xingQi>xingQiNow) {	// 未过期
					if(this.classroom.isAvailable()) {
						this.status=1;	// 待审核
					}else {
						this.status=6;	// 不可用
					}
				}else 	//过期
					this.status=5;
			}else {	// 过期
				this.status=5;
			}
		}else if(approval==true) {	// 已审核通过
			if (this.classroom.isAvailable()) {
				int dayDiff=semester.getDaysDiffS()-((this.zhouCi-1)*7+this.xingQi);
				if(dayDiff>0 && dayDiff<=3) {	// 如果在申请使用第2天至第4天内
					this.status=3;	// 可反馈
				}else {
					this.status=2;	// 不可反馈
				}
			}else {
				if (this.zhouCi>zhouCiNow || (this.zhouCi==zhouCiNow && this.xingQi>xingQiNow)) {
					this.status=6;	// 不可用
				}else {	// 历史已通过的申请
					this.status=2;	// 不可反馈
				}
			}
		}else {	// 审批不通过
			this.status=4;
		}
	}
}