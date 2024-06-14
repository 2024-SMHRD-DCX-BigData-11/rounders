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

public class HotPlayerDTO {
	
	private int hot_pid;
	@NonNull private String id;
	@NonNull private int player_id;
	private String v_date;
	

}
