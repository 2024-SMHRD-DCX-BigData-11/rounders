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

public class RecoredCommentDTO {

	private int rcmt_idx;
	private String rcmt_content;
	private String created_at;
	private String mem_id;

	public RecoredCommentDTO(String rcmt_content, String mem_id) {
		super();
		this.rcmt_content = rcmt_content;
		this.mem_id = mem_id;
	}

	public RecoredCommentDTO(String rcmt_content) {
		super();
		this.rcmt_content = rcmt_content;
	}
	
	

}