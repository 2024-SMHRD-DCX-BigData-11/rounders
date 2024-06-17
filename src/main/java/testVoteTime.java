import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;

import com.baseballtalk.model.MatchDAO;

public class testVoteTime {
	public static void main(String[] args) throws ParseException {
		String time = new MatchDAO().match_time(1);
		
		if(time.contains("종료")) {
			System.out.println("경기종료");
		}
		else if(time.contains("취소")) {
			System.out.println("경기취소");
		}else if (time.contains("회")) {
			System.out.println("경기중");
		}else {
		Date today = new Date();
		Calendar now = Calendar.getInstance();
		System.out.println(time);
		time = now.get(Calendar.YEAR) + "-" +  time;
		System.out.println(time);
		SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date date = fo.parse(time);
		System.out.println(date);
		System.out.println(today);
		int compare = date.compareTo(today);
		System.out.println(compare);
		if(compare<0) {
			System.out.println("투표불가");
		}else {
			System.out.println("투표가능");
		}
		}
	}
}
