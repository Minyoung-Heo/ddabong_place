package com.ezen.dda.storeaccount;

public interface StoreAccountService {
	public StoreAccountDTO storeAccountOut(String id); // 업체 계정 정보 출력
	public void storeAccountModify(String id, String pw, 
			String ceo, String phone, String email); // 업체 계정 정보 수정
	public StoreAccountDTO storeaccountleavechecking(String id, String pw); // 업체 계정 삭제 전 확인
	
}
