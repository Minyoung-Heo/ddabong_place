package com.ezen.dda.personalfunction;

import java.util.ArrayList;

public interface PersonalFnService {

	public ArrayList<ReviewDTO> review(String storeID);

	public ArrayList<DDAbongDTO> ddabong(String storeID, String month);

	public ArrayList<RegistrationDTO> registration(String storeID);



}
