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
@RequiredArgsConstructor
@Getter
@Setter
@ToString

public class FreeBoardDTO {
	
	@NonNull int board_idx;
	private String board_title;
	private String board_content;
	private String created_at;
	@NonNull int board_views;
	private int board_likes;
	private String board_file;
	private String mem_id;
	
	public FreeBoardDTO(int board_idx,String board_title, String board_content, String board_file, String mem_id) {
		super();
		this.board_idx = board_idx;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.mem_id = mem_id;
	}
	
	public FreeBoardDTO(String board_title, String board_content, String board_file, String mem_id) {
		super();
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_file = board_file;
		this.mem_id = mem_id;
	}

	public FreeBoardDTO(String mem_id ,int board_idx, int board_likes) {
		super();
		this.board_idx = board_idx;
		this.board_likes = board_likes;
	}

	public FreeBoardDTO(@NonNull int board_idx, String board_title, String board_content, String mem_id) {
		super();
		this.board_idx = board_idx;
		this.board_title = board_title;
		this.board_content = board_content;
		this.mem_id = mem_id;
	}
	

	
	
	
}
