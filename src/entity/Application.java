package entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
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
	private int xinQi;
	private int sJieCi;
	private int eJieCi;
	private String type;
	private String purpose;
	private String reviewer;
	private Date reviewerTime;
	private Boolean approval;
	
	private User user;
	private Classroom classroom;

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
	public int getXinQi() {
		return xinQi;
	}
	public void setXinQi(int xinQi) {
		this.xinQi = xinQi;
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
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public Date getReviewerTime() {
		return reviewerTime;
	}
	public void setReviewerTime(Date reviewerTime) {
		this.reviewerTime = reviewerTime;
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
}