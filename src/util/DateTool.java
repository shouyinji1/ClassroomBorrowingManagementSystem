package util;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;

public class DateTool {
	/** 计算指定日期和当前日期的差 */
	public static long periodDay(Date date) {
		Calendar calendar=Calendar.getInstance();
		calendar.setTime(date);
		LocalDate today = LocalDate.now();
        LocalDate specificDay = LocalDate.of(calendar.get(Calendar.YEAR),
        		calendar.get(Calendar.MONTH)+1,calendar.get(Calendar.DAY_OF_MONTH));
		long daysDiff = ChronoUnit.DAYS.between(specificDay, today);
		return daysDiff;
	}
}
