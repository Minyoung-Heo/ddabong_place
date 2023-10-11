package com.ezen.dda.store;

import java.util.ArrayList;

public interface StoreService {

	// 매장 등록
	public void storeinput(String store_id, String storename, String tel, String address, String lineintro,
			String intro, String imagefile, String main_menu, String mainimagefile, String region_name, String feature2,
			String dessert2);

	// 매장 출력
	public ArrayList<StoreDTO> storeoutput();

	// 회원 가입
	public void storejoin(String id, String pw, String ceo, String phone, String email);

	// 회원가입 아이디 체크
	public int storeidcheck(String id);

	// 업체 로그인
	public StoreDTO storelogincheck(String id, String pw);

}
