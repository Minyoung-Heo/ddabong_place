package com.ezen.dda.cafe;

import java.util.ArrayList;

public interface CafeService {
	public ArrayList<CafeDTO> cafeOut(); // 전체 카페 보러가기
	public ArrayList<CafeDTO> reviewStar(); // 별점 평균, 리뷰 수 출력
	public ArrayList<CafeDTO> cafeRegion(String region_name); // 지역별 카페 보기
	
}
