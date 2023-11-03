package com.ezen.dda.store;

import java.util.ArrayList;

import com.ezen.dda.personalfunction.ReservationDTO;

public interface StoreService {

	// 매장 등록
	public void storeinput(StoreDTO dto);
	public void insertDDA(String id);

	// 매장 출력
	public ArrayList<StoreDTO> storeoutput(String store_id);

	// 회원 가입
	public void storejoin(String id, String pw, String ceo, String phone, String email);

	// 회원가입 아이디 체크
	public int storeidcheck(String id);

	// 업체 로그인
	public StoreDTO storelogincheck(String id, String pw);
	
	//매장 수정창
	public ArrayList<StoreDTO> storemodifyview(String store_id);
	
	//매장 수정 입력
	public void storemodifyfinal(StoreDTO dto);
	
	//매장 삭제
	public void storedelete(String id);
	public void registrationdelete(String id); //store 테이블의 외래키인 매장 등록 테이블 id 같이 삭제
	public void ddabongdelete(String id); //store 테이블의 외래키인 따봉 수 테이블 id 같이 삭제
	public void stardelete(String id); //store 테이블의 외래키인 즐겨찾기 id 같이 삭제
	public void waitingdelete(String id); //store 테이블의 외래키인 웨이팅 테이블 id 같이 삭제
	public void reservationdelete(String id); //store 테이블의 외래키인 예약 테이블 id 같이 삭제
	
	//탈퇴 전 비밀번호 인증
	public StoreDTO storeleavechecking(String id, String pw);
	
	// 아이디 찾기
	public ArrayList<StoreDTO> storeidResult(String ceo, String email);

	// 비밀번호 찾기
	public ArrayList<StoreDTO> storepwResult(String ceo, String id);
	
	//마이페이지 들어가기 전 비밀번호 인증
	public StoreDTO storepwchecking(String id, String pw);
	public void storepwcheck(String store_id);
	
	// 예정 예약 현황
	public ArrayList<StoreDTO> storeStatus(String store_id);
	// 지난 예약 현황
	public ArrayList<StoreDTO> storeStatusPass(String store_id);
	
	// 예약 삭제
	public void storeReservationDelete(String reservation_num); 
	public void storeReviewDelete(String reservation_num); 
	
	// 캘린더
	public ArrayList<ReservationDTO> calendar(String store_id);
}
