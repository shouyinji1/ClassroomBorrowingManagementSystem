package entity;

import java.io.Serializable;
import java.util.Date;

/** 学期信息 */
public class Semester implements Serializable{
	private Date sDate;
	private int tWeeks;

	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public int gettWeeks() {
		return tWeeks;
	}
	public void settWeeks(int tWeeks) {
		this.tWeeks = tWeeks;
	}
}
