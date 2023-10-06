package com.ezen.dda.search;

import java.util.ArrayList;

public interface Service {

	public ArrayList<SearchDTO> storesearch(String searchValue2);//상호명 검색

	public ArrayList<SearchDTO> regionsearch(String searchValue2);//지역별 검색

}
