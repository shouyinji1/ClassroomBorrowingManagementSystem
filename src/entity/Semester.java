package entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

/** 学期信息 */
@Component("semester")
public class Semester implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String sName;
	@DateTimeFormat(pattern="yyyy-MM-dd")	//防止前端传值时typeMismatch.java.util.Date
	private Date sDate;
	private int tWeeks;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
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
	
	/** 获取今天相对于学期初相差多少天 */
	public int getDaysDiffS() {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(this.sDate);
		LocalDate today = LocalDate.now();
        LocalDate specificDay = LocalDate.of(calendar.get(Calendar.YEAR),
        		calendar.get(Calendar.MONTH)+1,calendar.get(Calendar.DAY_OF_MONTH));
		return (int)ChronoUnit.DAYS.between(specificDay, today);
	}

	/** 获取当前周次 */
	public int getZhouCiNow() {
		return this.getDaysDiffS()/7+1;
	}
	/** 根据学期初始日期推算当前星期几 
	 * @return 1-7:星期一~星期日
	 * */
	public int getXingQiNow() {
		return this.getDaysDiffS()%7+1;
	}

}
