package com.ezen.dda.personalfunction;

import java.util.ArrayList;

public interface PersonalFnService {

	public ArrayList<ReviewDTO> review(String storeID);

	public ArrayList<DDAbongDTO> ddabong(String storeID, String month);

	public ArrayList<RegistrationDTO> registration(String storeID);

	public ArrayList<ReservationDTO>  reservation(String storeID, String customer_id, String reservation_date, String reservation_time,
			int person_num);
	
	public ArrayList<ReservationDTO> myStatus(String customer_id);



}
