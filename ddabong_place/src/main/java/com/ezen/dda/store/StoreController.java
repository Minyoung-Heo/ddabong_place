package com.ezen.dda.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class StoreController {

	@Autowired
	SqlSession sqlSession;
	// 각자 이미지 폴더 위치 넣기
	static String imagepath = "C:\\Users\\pyo66\\ddabong_place\\ddabong_place\\src\\main\\webapp\\image";

	// storeinput 입력창
	@RequestMapping(value = "/storeinput")
	public String store1() {
		return "storeinput";
	}

	// storeinput 입력창에서 입력 후 db 저장
	@RequestMapping(value = "/storeinputsave", method = RequestMethod.POST)
	public String store2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String store_id = mul.getParameter("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("address");
		String lineintro = mul.getParameter("lineintro");
		String intro = mul.getParameter("intro");
		MultipartFile mf1 = mul.getFile("image");
		String imagefile = mf1.getOriginalFilename();
		String main_menu = mul.getParameter("main_menu");
		MultipartFile mf2 = mul.getFile("main_image");
		String mainimagefile = mf2.getOriginalFilename();
		String region_name = mul.getParameter("region_name");
		String[] feature = mul.getParameterValues("feature");
		String[] dessert = mul.getParameterValues("dessert");

		// 특징과 디저트 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
		String feature2 = "";
		for (int i = 0; i < feature.length; i++) {
			feature2 += feature[i];
			if (i < feature.length - 1) {
				feature2 += ",";
			}
		}

		String dessert2 = "";
		for (int j = 0; j < dessert.length; j++) {
			dessert2 += dessert[j];
			if (j < dessert.length - 1) {
				dessert2 += ",";
			}
		}

		mf1.transferTo(new File(imagepath + "\\" + imagefile));
		mf2.transferTo(new File(imagepath + "\\" + mainimagefile));
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storeinput(store_id, storename, tel, address, lineintro, intro, imagefile, main_menu, mainimagefile,
				region_name, feature2, dessert2);

		return "redirect:main";
	}

	// storeoutput 출력창
	@RequestMapping(value = "/storeoutput")
	public String store3(Model md) {
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ArrayList<StoreDTO> list = ss.storeoutput();
		md.addAttribute("list", list);

		return "storeoutput";
	}

	// 업체용 로그인 화면
	@RequestMapping(value = "/storeLogin")
	public String storeLogin() {
		return "storeLogin";
	}

//  업체용 로그인 확인
	@RequestMapping(value = "/storelogincheck", method = RequestMethod.POST)
	public String storelogincheck(HttpServletRequest request) {
		String id = request.getParameter("storeid");
		String pw = request.getParameter("storepw");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		StoreDTO dto = ss.storelogincheck(id, pw);
		if (dto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("store", dto);
			hs.setAttribute("storeloginstate", true);
			hs.setMaxInactiveInterval(3600);

			return "main";
		} else {

			return "storeloginerr";
		}
	}

//  업체 로그아웃
	@RequestMapping(value = "/storelogout")
	public String storelogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();

		hs.removeAttribute("store");
		hs.setAttribute("storeloginstate", false);

		return "redirect:/";
	}

	// 업체용 회원가입 화면
	@RequestMapping(value = "/storeJoin")
	public String storeJoin() {
		return "storeJoin";
	}

//  업체 회원가입 전송
	@RequestMapping(value = "/storesave", method = RequestMethod.POST)
	public String in2(HttpServletRequest request) {
		String id = request.getParameter("storeid");
		String pw = request.getParameter("storepw");
		String ceo = request.getParameter("storename");
		String phone = request.getParameter("storephone");
		String email = request.getParameter("storeemail");

		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storejoin(id, pw, ceo, phone, email);

		return "main";
	}

//  아이디 중복확인 체크
	@ResponseBody
	@RequestMapping(value = "/storeidcheck")
	public String out4(String id) {
		StoreService ss = sqlSession.getMapper(StoreService.class);
		int cnt = ss.storeidcheck(id);
		String bb = null;
		if (cnt == 0) {
			bb = "ok";
		} else {
			bb = "";
		}
		return bb;
	}
}