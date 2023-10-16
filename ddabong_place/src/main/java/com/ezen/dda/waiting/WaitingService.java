package com.ezen.dda.waiting;

public interface WaitingService {
	public void waitingSave(WaitingDTO waitingDTO); // 웨이팅 걸기
	public WaitingDTO waitingOut(String store_id, String customer_id); // 웨이팅 대기번호 출력
}
