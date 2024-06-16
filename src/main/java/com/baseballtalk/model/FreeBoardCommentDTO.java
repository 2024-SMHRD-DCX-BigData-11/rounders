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

public class FreeBoardCommentDTO {
	
	private int cmt_idx;
	private int board_idx;
	private String cmt_content;
	private String created_at;
	private String mem_id;
	
	
}
