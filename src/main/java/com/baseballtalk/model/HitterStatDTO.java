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

public class HitterStatDTO {
	private int hitter_idx;
	private float war;
	private int game_played;
	private float avg;
	private int homerun;
	private float slg;
	private float obp;
	private int stealbase;
	private int rbi;
	private float ops;
}
