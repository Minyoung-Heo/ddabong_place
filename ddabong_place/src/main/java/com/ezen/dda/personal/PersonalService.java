package com.ezen.dda.personal;

import java.util.ArrayList;

public interface PersonalService {
//	회원 가입
	public void personaljoin(String id, String pw, String name, String nickname, String phone, String address,
			String email);

//	회원가입 아이디 체크
	public int idcheck(String id);

//	로그인
	public PersonalDTO personallogincheck(String id, String pw);

//	마이페이지 들어가기 전 비밀번호 인증
	public PersonalDTO personalpwchecking(String id, String pw);
//	탈퇴전 비밀번호 인증
	public PersonalDTO personalleavechecking(String id, String pw);

//	아이디 찾기
	public ArrayList<PersonalDTO> personalidResult(String name, String email);

//	비밀번호 찾기
	public ArrayList<PersonalDTO> personalpwResult(String name, String id);

//	회원 정보 수정
	public void personalModifysave(String id, String pw, String name, String nickname, String phone, String address,
			String email);

//	회원 탈퇴
	public void reservationdelete(String id); // 회원아이디를 외래키로 갖는 테이블의 데이터 삭제
	public void stardelete(String id); // 외래키 갖는 테이블의 데이터 삭제
	public void waitingdelete(String id); // 웨이팅 테이블에 저장된 회원 데이터 삭제
	public void personaldelete(String id);

}
