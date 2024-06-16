package com.baseballtalk.model;

import java.util.Date;

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
@RequiredArgsConstructor

public class MemberDTO {
	
	@NonNull private String mem_id;
	@NonNull private String mem_pw;
	private String mem_name;
	private String mem_nick;
	private String mem_tel;
	private int team_idx;
	private Date joined_at;
	private String mem_grade;
	private int mem_point;
	
	public MemberDTO(String id, String name, String tel) {
		super();
		this.mem_id = id;
		this.mem_name = name;
		this.mem_tel = tel;
	}
	
	public MemberDTO(String id,String pw, String name, String nick, String tel, int team_Num) {
		super();
		this.mem_id = id;
		this.mem_pw = pw;
		this.mem_name = name;
		this.mem_nick = nick;
		this.mem_tel = tel;
		this.team_idx = team_Num;
	}

	
}
