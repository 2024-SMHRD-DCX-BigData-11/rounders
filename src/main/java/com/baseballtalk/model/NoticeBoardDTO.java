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

public class NoticeBoardDTO {
	
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private int notice_views;
	private String mem_id;
	private String notice_category;
	private String created_at;
	
	public NoticeBoardDTO(String notice_title, String notice_content, String mem_id, String notice_category) {
		super();
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.mem_id = mem_id;
		this.notice_category = notice_category;
	}
	
	public NoticeBoardDTO(int notice_idx,String notice_title, String notice_content, String mem_id, String notice_category) {
		super();
		this.notice_idx  = notice_idx;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.mem_id = mem_id;
		this.notice_category = notice_category;
	}
	

	

}
