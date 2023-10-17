package com.ezen.dda.waiting;

import java.util.ArrayList;

public interface WaitingService {
	public void waitingSave(WaitingDTO waitingDTO); // 웨이팅 걸기
	public WaitingDTO waitingOut(String store_id, String customer_id); // 웨이팅 대기번호 출력
	public ArrayList<WaitingDTO> mywaiting(String customer_id); // 웨이팅 현황 보러가기
	public WaitingDTO waitingDetail(String store_id, String customer_id); // 대기번호 조회
}
