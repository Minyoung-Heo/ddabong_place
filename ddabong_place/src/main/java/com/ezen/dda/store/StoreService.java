package com.ezen.dda.store;

import java.util.ArrayList;

public interface StoreService {

	public void storeinput(String store_id, String storename, String tel, String address, String lineintro,
			String intro, String imagefile, String main_menu, String mainimagefile, String region_name, String feature2,
			String dessert2);
	public ArrayList<StoreDTO> storeoutput();
	
}
