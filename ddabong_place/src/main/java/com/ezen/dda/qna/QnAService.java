package com.ezen.dda.qna;

import java.util.ArrayList;

public interface QnAService {
	public void questionInput(QnADTO qnaDTO); // 1:1 문의 DB 저장
	public ArrayList<QnADTO> storeQnA(); // 업체 QnA 리스트 출력
	public ArrayList<QnADTO> storeSearch(String searchType, String searchContent); // 업체 QnA 검색
	public ArrayList<QnADTO> customerQnA(); // 손님 QnA 리스트 출력
	public ArrayList<QnADTO> customerSearch(String searchType, String searchContent); // 손님 QnA 검색
	public QnADTO questionDetail(int question_num); // 문의글 상세보기
}
