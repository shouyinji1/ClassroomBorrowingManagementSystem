package entity;

import java.io.Serializable;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/** 学期信息 */
@Alias("semester")
@Component
public class Semester implements Serializable{
	private static final long serialVersionUID = 1L;

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
