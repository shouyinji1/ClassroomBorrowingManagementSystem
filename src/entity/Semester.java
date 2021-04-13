package entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

/** 学期信息 */
@Component("semester")
public class Semester implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private Date sDate;
	private int tWeeks;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
	
	public int getZhouCi() {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(this.sDate);
		LocalDate today = LocalDate.now();
        LocalDate specificDay = LocalDate.of(calendar.get(Calendar.YEAR),
        		calendar.get(Calendar.MONTH)+1,calendar.get(Calendar.DAY_OF_MONTH));
		long daysDiff = ChronoUnit.DAYS.between(specificDay, today);
		return (int) (daysDiff/7+1);
	}
}
