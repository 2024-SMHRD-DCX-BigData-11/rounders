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
	private int war;
	private int game_played;
	private int avg;
	private int homerun;
	private int slg;
	private int obp;
	private int stealbase;
	private int rbi;
	private int ops;
}
