package com.ezen.dda.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface StoreService {

//	public void storeinput(String store_id, String storename, String tel, String address, String lineintro,
//			String intro, String imagefile, String main_menu, String mainimagefile, String region_name, String feature2,
//			String dessert2);
	public ArrayList<StoreDTO> storeoutput();
	public void storeinput(String store_id, String storename, String tel, String address, String lineintro,
			String intro, List<MultipartFile> filelist, String main_menu, String region_name, String feature2,
			String dessert2);
	public ArrayList<StoreDTO> storemodifyview();
	public void storemodifyfinal(String store_id, String storename, String tel, String address, String lineintro,
			String intro, List<MultipartFile> filelist1, String main_menu, List<MultipartFile> filelist2,
			String region_name, String feature2, String dessert2);
	
}
