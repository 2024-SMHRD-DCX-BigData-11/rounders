package com.baseballtalk.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class RankDTO {
	private int team_idx;
	private String team_name;
	private String team_rank;
	private String game_playerd;
	private String team_win;
	private String team_drw;
	private String team_lose;
	private float game_behind;
	private float win_percentage;
	private int run_score;
	private int lose_score;
}
