package entity;

import java.io.Serializable;
import java.util.Date;

/** 教室申请表 */
public class ApplicationForm implements Serializable{
	/** 教室申请表ID */
	private String id;
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
	private boolean approval;

	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public boolean isApproval() {
		return approval;
	}
	public void setApproval(boolean approval) {
		this.approval = approval;
	}
}
