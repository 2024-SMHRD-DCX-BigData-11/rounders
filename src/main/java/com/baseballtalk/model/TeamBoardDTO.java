package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString

public class TeamBoardDTO {
	
	private int board_idx;
	private int team_idx;
	private String board_category;
	private String board_title;
	private String board_content;
	private String created_at;
	private int board_views;
	private int board_likes;
	private String board_file;
	private String mem_id;
	
	public TeamBoardDTO(int board_idx, int team_idx, String board_category, String board_title, String board_content,
			String board_file, String mem_id) {
		super();
		this.board_idx = board_idx;
		this.team_idx = team_idx;
		this.board_category = board_category;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.mem_id = mem_id;
	}
	
	
	
	

}
