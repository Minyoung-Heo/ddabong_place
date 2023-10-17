package com.ezen.dda.personalfunction;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalFnController {
	@Autowired
	SqlSession sqlSession;

	// 매장 상세 정보,해당 매장 리뷰 등을 출력.
	@RequestMapping(value = "/detailview")
	public String detailview(HttpServletRequest request, Model mo) {
		String storeID = request.getParameter("store_id");

		int mon = LocalDate.now().getMonthValue(); // 현재 월을 숫자 1~12 로 받아옴
		String month; // 문자 월
		switch (mon) { // 숫자 월을 문자 월로 변환
		case 1:
			month = "jan";
			break;
		case 2:
			month = "feb";
			break;
		case 3:
			month = "mar";
			break;
		case 4:
			month = "apr";
			break;
		case 5:
			month = "may";
			break;
		case 6:
			month = "jun";
			break;
		case 7:
			month = "jul";
			break;
		case 8:
			month = "aug";
			break;
		case 9:
			month = "sep";
			break;
		case 10:
			month = "oct";
			break;
		case 11:
			month = "nov";
			break;
		default:
			month = "dcb";
		}

		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);

		ArrayList<ReviewDTO> reviewlist = ss.review(storeID);
		ArrayList<DDAbongDTO> ddabonglist = ss.ddabong(storeID, month);
		ArrayList<RegistrationDTO> registrationlist = ss.registration(storeID);

		// 이미지 파일명을 처리하여 imageList에 저장
		for (RegistrationDTO registrationDTO : registrationlist) {
			String image = registrationDTO.getImage(); // dto의 이미지 데이터를 image에 저장.

			// image가 null이거나 비어있을경우가 아닐때 imageFileNames에 콤마와 공백을 기준으로 배열저장.
			if (image != null && !image.isEmpty()) {
				String[] imageFileNames = image.split("[,\\s]+");

				// imageFileNames를 리스트화 시키고 ArrayList에 집어넣은 imageList를 만들고 DTO의 imagelist 배열에
				// 저장.
				List<String> imageList = new ArrayList<>(Arrays.asList(imageFileNames));
				registrationDTO.setImageList(imageList);
			}
		}

		mo.addAttribute("reviewlist", reviewlist);
		mo.addAttribute("ddabonglist", ddabonglist);
		mo.addAttribute("registrationlist", registrationlist);

		return "personaldetail";
	}

	@RequestMapping(value = "/reserv")
	public String reserv(HttpServletRequest request, Model mo) {

		String storeID=request.getParameter("storeID");
		String storename=request.getParameter("storename");
		mo.addAttribute("storeID", storeID);
		mo.addAttribute("storename", storename);
		
		return "reservation";
	}
	@RequestMapping(value = "/reservsave")
	public String reservsave(HttpServletRequest request, Model mo) {

		String storeID=request.getParameter("storeid");
		String customer_id=request.getParameter("customer_id");
		String reservation_date=request.getParameter("reservation_date");
		String reservation_time=request.getParameter("reservation_time");
		int person_num=Integer.parseInt(request.getParameter("person_num"));
		
		PersonalFnService ss = sqlSession.getMapper(PersonalFnService.class);
		ss.reservation(storeID,customer_id,reservation_date,reservation_time,person_num);
		
		return "redirect:/main";
	}

}
