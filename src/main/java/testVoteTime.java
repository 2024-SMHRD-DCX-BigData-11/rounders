import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.baseballtalk.model.MatchDAO;

public class testVoteTime {
	public static void main(String[] args) throws ParseException {
		String time = new MatchDAO().match_time(1);
		Date today = new Date();
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
