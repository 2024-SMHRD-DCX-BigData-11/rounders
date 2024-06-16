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
	
	private int hot_idx;
	@NonNull private String mem_id;
	@NonNull private int player_idx;
	private String created_at;
	

}
