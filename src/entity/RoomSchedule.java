package entity;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/** 教室使用状态 */
@Component("roomSchedule")
public class RoomSchedule implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String roomID;
	private String userID;
	private int zhouCi;
	private int xingQi;
	private int sJieCi;
	private int eJieCi;
	private String type;
	private String purpose;

	private User user;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	/** 输出格式化的星期 */
	public String getFormatXingQi() {
		switch (this.xingQi) {
			case 1: return "一";
			case 2: return "二";
			case 3: return "三";
			case 4: return "四";
			case 5: return "五";
			case 6: return "六";
			case 7: return "日";
			default:
				throw new IllegalArgumentException("Unexpected value: " + this.xingQi);
		}
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
