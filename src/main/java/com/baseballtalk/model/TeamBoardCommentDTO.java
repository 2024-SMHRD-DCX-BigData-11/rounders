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

	private int comment_Num;
	private int board_Num;
	private String writer;
	private String content;
	private String c_date;

}
