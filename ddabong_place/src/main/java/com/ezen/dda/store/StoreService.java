package com.ezen.dda.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StoreService {

	// 매장 등록
	public void storeinput(StoreDTO storeDTO);
	public void insertDDA(String id);

	// 매장 출력
	public ArrayList<StoreDTO> storeoutput();

	// 회원 가입
	public void storejoin(String id, String pw, String ceo, String phone, String email);

	// 회원가입 아이디 체크
	public int storeidcheck(String id);

	// 업체 로그인
	public StoreDTO storelogincheck(String id, String pw);
	
	//매장 수정창
	public ArrayList<StoreDTO> storemodifyview(String store_id);
	
	//매장 수정 입력
	public void storemodifyfinal(StoreDTO storeDTO);

	// 아이디 찾기
	public ArrayList<StoreDTO> storeidResult(String ceo, String email);

	// 비밀번호 찾기
	public ArrayList<StoreDTO> storepwResult(String ceo, String id);
}
