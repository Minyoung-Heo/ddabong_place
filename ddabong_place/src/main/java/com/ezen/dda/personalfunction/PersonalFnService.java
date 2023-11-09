package com.ezen.dda.personalfunction;

import java.util.ArrayList;

public interface PersonalFnService {

	public ArrayList<ReviewDTO> review(String storeID);

	public ArrayList<DDAbongDTO> ddabong(String storeID, String month);

	public ArrayList<RegistrationDTO> registration(String storeID);

	public void reservation(String customer_id,String storeID, String reservation_date, String reservation_time,
			int person_num, String reservation_name);
	
	public ArrayList<ReservationDTO> myStatus(String customer_id);

	public int reviewcheck(String customerid, String storeid);

	public ArrayList<ReviewDTO> reservnumlist(String storeid, String customerid);

	public void reviewsave(Double reservnum, String content, String imagesname, double star, String dateString);

	public void reservationDelete(String reservation_num);
	
	public int duplicatecheck(String customer_id, String reservation_date, String storeidid);

	public void ddaplus(String month, String store_id);

	public void addsubscribe(String store_id, String customer_id);

	public int subscribecheck(String customer_id, String store_id);

	public void canclesubscribe(String customer_id, String store_id);

	public ArrayList<SubscribeDTO> starlist(String customer_id); //즐겨찾기 출력
	
	public void reviewDelete(int review_num);

}
