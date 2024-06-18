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

public class PitcherStatDTO {
	
	private int pitcher_idx;
	private float k_per_9;
	private float b_per_9;
	private float hr_per_9;
	private float babip;
	private float fip;
	private float fip_war;
	private float ra9_war;
	private int game_played;
	private int gs;
	private int player_win;
	private int player_lose;
	private int saves;
	private int hold;
	private float ip;
	private float era;
	
}
