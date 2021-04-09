package entity;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/** 教室使用状态 */
@Component("roomStatus")
public class RoomStatus implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String roomID;
	private String userID;
	private int zhouCi;
	private int xinQi;
	private int sJieCi;
	private int eJieCi;
	private String type;
	private String purpose;

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
}
