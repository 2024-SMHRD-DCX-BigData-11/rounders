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

public class TeamBoardCommentDTO {

	private int cmt_idx;
	private int board_idx;
	private String cmt_content;
	private String created_at;
	private String mem_id;

	public TeamBoardCommentDTO(int board_idx, String cmt_content, String mem_id) {
		super();
		this.board_idx = board_idx;
		this.cmt_content = cmt_content;
		this.mem_id = mem_id;
	}

}
