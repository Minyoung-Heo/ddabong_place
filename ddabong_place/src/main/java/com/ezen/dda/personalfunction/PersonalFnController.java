package com.ezen.dda.personalfunction;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalFnController {
@Autowired
SqlSession sqlSession;
	
	@RequestMapping(value = "/detailview")
	public String detailview(HttpServletRequest request,Model mo)
	{	String storeID = request.getParameter("store_id");
	
		int mon = LocalDate.now().getMonthValue(); // 현재 월을 숫자 1~12 로 받아옴
		String month; // 문자 월
		switch(mon) { // 숫자 월을 문자 월로 변환
		case 1: month = "jan"; break;
		case 2: month = "feb"; break;
		case 3: month = "mar"; break;
		case 4: month = "apr"; break;
		case 5: month = "may"; break;
		case 6: month = "jun"; break;
		case 7: month = "jul"; break;
		case 8: month = "aug"; break;
		case 9: month = "sep"; break;
		case 10: month = "oct"; break;
		case 11: month = "nov"; break;
		default: month = "dcb";
		}
		
		PersonalFnService ss=sqlSession.getMapper(PersonalFnService.class);
		ArrayList<ReviewDTO> reviewlist=ss.review(storeID);
		ArrayList<DDAbongDTO> ddabonglist=ss.ddabong(storeID,month);
		ArrayList<RegistrationDTO> registrationlist=ss.registration(storeID);
		
		mo.addAttribute("reviewlist", reviewlist);
		mo.addAttribute("ddabonglist", ddabonglist);
		mo.addAttribute("registrationlist", registrationlist);
			
		return "personaldetail";
	}
	
}
