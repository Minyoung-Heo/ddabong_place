package com.ezen.dda.waiting;

import java.util.ArrayList;

public interface WaitingService {
	public void waitingSave(WaitingDTO waitingDTO); // 웨이팅 걸기
	public WaitingDTO waitingOut(String store_id, String customer_id); // 웨이팅 대기번호 출력
	public ArrayList<WaitingDTO> mywaiting(String customer_id); // 웨이팅 현황 보러가기
	public WaitingDTO waitingDetail(String store_id, String customer_id); // 대기번호 조회
	public void cancelWaiting(String store_id, int waiting_num); // 손님 측 웨이팅 취소
	public void updateWaitingNum(String store_id, int waiting_num); // 웨이팅 번호 차감
	public ArrayList<WaitingDTO> waitingList(String store_id); // 웨이팅 리스트 출력
	public void call(String store_id, int waiting_num); // 대기자 호출
	public void enter(String store_id); // 입장 완료
}
