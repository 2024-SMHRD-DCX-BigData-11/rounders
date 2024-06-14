package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
	
	private int player_id;
	private String player_name;
	private String team_name;
	private String born;
	private String position;
	private String player_likes;
	private String player_img;
	private int player_number;

}
