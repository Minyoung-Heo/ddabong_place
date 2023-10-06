package com.ezen.dda.store;

import java.io.File;
import java.io.IOException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class StoreController {
	
	@Autowired
	SqlSession sqlSession;
	static String imagepath = "C:\\Users\\wjdql\\ddabong_place\\ddabong_place\\src\\main\\webapp\\image"; //각자의 이미지 폴더 위치 넣기
	
	//storeinput 입력창
	@RequestMapping(value = "/storeinput")
	public String store1() {
		return "storeinput";
	}
	
	//storeinput 입력창에서 db 저장
	@RequestMapping(value = "/storeinputsave", method = RequestMethod.POST)
	public String store2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String store_id = mul.getParameter("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("address");
		String intro = mul.getParameter("intro");
		MultipartFile mf1 = mul.getFile("image");
		String imagefile = mf1.getOriginalFilename();
		String main_menu = mul.getParameter("main_menu");
		MultipartFile mf2 = mul.getFile("main_image");
		String mainimagefile = mf2.getOriginalFilename();
		String region_name = mul.getParameter("region_name");
		String [] feature = mul.getParameterValues("feature");
		String [] dessert = mul.getParameterValues("dessert");
		
		
		String feature2 = "";
		for(int i=0; i<feature.length; i++) {
			feature2 += feature[i]+",";
		}
		String commadel1 = feature2;
		if(commadel1.endsWith(",")){
			commadel1 = commadel1.substring(0, commadel1.length()-1);
		}
		
		String dessert2 = "";
		for(int i=0; i<dessert.length; i++) {
			dessert2 += dessert[i]+",";
		}
		
		String commadel2 = dessert2;
		if(commadel2.endsWith(",")){
			commadel2 = commadel2.substring(0, commadel2.length()-1);
		}
		
		mf1.transferTo(new File(imagepath+"\\"+imagefile));
		mf2.transferTo(new File(imagepath+"\\"+mainimagefile));
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storeinput(store_id,storename,tel,address,intro,imagefile,main_menu,mainimagefile,region_name,feature2,dessert2);
		
		return "redirect:main";
	}

}
