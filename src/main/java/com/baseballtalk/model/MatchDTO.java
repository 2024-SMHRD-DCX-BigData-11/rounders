package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class MatchDTO {
	
	private int Match_no;
	private String Match_date;
	private String Match_time;
	private String Home_team;
	private String Home_pitcher;
	private String Away_team;
	private String Away_pitcher;
	
}
