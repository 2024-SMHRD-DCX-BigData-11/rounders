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

public class PltcherStatDTO {
	private int pitcher_idx;
	private int k_per_9;
	private int b_per_9;
	private int hr_per_9;
	private int babip;
	private int fip;
	private int fip_war;
	private int ra9_war;
	private int game_played;
	private int gs;
	private int player_win;
	private int player_lose;
	private int saves;
	private int hold;
	private int ip;
	private int era;
	
}
