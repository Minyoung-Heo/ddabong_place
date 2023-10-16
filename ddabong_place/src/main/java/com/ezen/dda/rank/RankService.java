package com.ezen.dda.rank;

import java.util.ArrayList;

public interface RankService {
	public ArrayList<RankDTO> monthDDA(RankDTO rankDTO); // 이달의 따봉 1, 2, 3위
	public ArrayList<RankDTO> awardDDA(); // 따봉 어워드 1, 2, 3위
	public ArrayList<RankDTO> hotRank(); // 예약 핫랭킹 
}
