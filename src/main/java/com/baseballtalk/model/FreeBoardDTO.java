package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString

public class FreeBoardDTO {
	
	private int board_idx;
	private String board_title;
	private String board_content;
	private String created_at;
	private int board_views;
	private int board_likes;
	private String board_file;
	private String mem_id;
	
}
