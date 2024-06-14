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
	
	@NonNull private String id;
	@NonNull private String pw;
	private String name;
	private String nick;
	private String tel;
	private int team_Num;
	private Date j_date;
	private String grade;
	private int point;
	
	public MemberDTO(@NonNull String id, String name, String tel) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
	}
	
	public MemberDTO(@NonNull String id,String pw, String name, String nick, String tel, int team_Num) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.tel = tel;
		this.team_Num = team_Num;
	}

}
