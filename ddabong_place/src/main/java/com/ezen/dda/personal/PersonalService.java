package com.ezen.dda.personal;

import java.util.ArrayList;

public interface PersonalService {
//	회원 가입
	public void personaljoin(String id, String pw, String name, String nickname, String phone, String address, String email);

//	회원가입 아이디 체크
	public int idcheck(String id);

//	로그인
	public PersonalDTO personallogincheck(String id, String pw);
	
//	아이디 찾기
	public ArrayList<PersonalDTO> personalidResult(String name, String email);
	
//	비밀번호 찾기
	public ArrayList<PersonalDTO> personalpwResult(String name, String id);
	
	

}
