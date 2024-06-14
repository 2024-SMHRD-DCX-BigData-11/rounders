package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
@RequiredArgsConstructor


public class TeamDTO {
	
	private int team_Num;
	private String team_name;
	@NonNull private String team_log;
	private String team_url;
	
	

}
