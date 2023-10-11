package com.ezen.dda.personal;

public interface PersonalService {
//	회원 가입
	public void personaljoin(String id, String pw, String name, String nickname, String phone, String address, String email);

//	회원가입 아이디 체크
	public int idcheck(String id);

//	로그인
	public PersonalDTO personallogincheck(String id, String pw);

}
