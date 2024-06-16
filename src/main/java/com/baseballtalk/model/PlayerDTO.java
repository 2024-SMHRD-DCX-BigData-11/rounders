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

public class PlayerDTO {
	
	private int player_idx;
	private String player_name;
	private int team_name;
	private String player_born;
	private String player_position;
	private int player_likes;
	private String player_img;
	private String player_number;

}
