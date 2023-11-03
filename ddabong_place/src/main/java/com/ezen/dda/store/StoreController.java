package com.ezen.dda.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

import com.ezen.dda.personalfunction.ReservationDTO;

@Controller
public class StoreController {

	@Autowired
	SqlSession sqlSession;
	// 각자 이미지 폴더 위치 넣기
	static String imagepath = "C:\\Users\\minyoung\\ddabong_place\\ddabong_place\\src\\main\\webapp\\image";
	ArrayList<StoreDTO> list = new ArrayList<StoreDTO>();

	// 매장 입력창
	@RequestMapping(value = "/storeinput")
	public String store1() {

		return "storeinput";
	}

	// 매장 입력창에서 입력 후 db 저장
	@RequestMapping(value = "/storeinputsave", method = RequestMethod.POST)
	public String store2(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String store_id = mul.getParameter("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("addr2") + " " + mul.getParameter("addr3");
		String lineintro = mul.getParameter("lineintro");
		String intro = mul.getParameter("intro").replace("\n", "<br>");
		List<MultipartFile> filelist1 = mul.getFiles("image"); // 이미지 다중 파일 업로드
		String main_menu = mul.getParameter("main_menu");
		MultipartFile mf2 = mul.getFile("main_image");
		String filelist2 = mf2.getOriginalFilename();
		String region_name = mul.getParameter("region_name");
		String[] feature = mul.getParameterValues("feature");
		String[] dessert = mul.getParameterValues("dessert");

		// 특징과 디저트 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
		String feature2 = "";
		for (int i = 0; i < feature.length; i++) {
			feature2 += feature[i];
			if (i < feature.length - 1) {
				feature2 += ", ";
			}
		}

		String dessert2 = "";
		for (int j = 0; j < dessert.length; j++) {
			dessert2 += dessert[j];
			if (j < dessert.length - 1) {
				dessert2 += ", ";
			}
		}

		String imagesName1 = "";
		for (MultipartFile mf1 : filelist1) {
			String imagefile = mf1.getOriginalFilename(); // 원본 파일명
			imagesName1 += imagefile + " ";
			try {
				mf1.transferTo(new File(imagepath + "\\" + imagefile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		mf2.transferTo(new File(imagepath + "\\" + filelist2));

		StoreDTO dto = new StoreDTO(store_id, storename, tel, address, lineintro, intro, imagesName1, main_menu,
				filelist2, region_name, feature2, dessert2);
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storeinput(dto);
		ss.insertDDA(store_id);
		return "redirect:/main";
	}

	// 매장 출력창
	@RequestMapping(value = "/storeoutput", method = RequestMethod.GET)
	public String store3(HttpServletRequest request, Model md) {
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ArrayList<StoreDTO> list = ss.storeoutput(store_id);
		md.addAttribute("list", list);

		return "storeoutput";
	}

	// 매장 수정창
	@RequestMapping(value = "/storemodifyview", method = RequestMethod.GET)
	public String store4(Model md, HttpServletRequest request) {
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ArrayList<StoreDTO> list = ss.storemodifyview(store_id);
		md.addAttribute("list", list);

		return "storemodify";
	}

	// 매장 수정창에서 수정 후 db 등록
	@RequestMapping(value = "/storemodifysave", method = RequestMethod.POST)
	public String store5(MultipartHttpServletRequest mul) throws IllegalStateException, IOException {
		String store_id = mul.getParameter("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("addr2") + " " + mul.getParameter("addr3");
		String lineintro = mul.getParameter("lineintro");
		String intro = mul.getParameter("intro").replace("\n", "<br>");
		List<MultipartFile> filelist1 = mul.getFiles("image"); // 이미지 다중 파일 업로드
		String main_menu = mul.getParameter("main_menu");
		MultipartFile mf2 = mul.getFile("main_image");
		String filelist2 = mf2.getOriginalFilename();
		String region_name = mul.getParameter("region_name");
		String[] feature = mul.getParameterValues("feature");
		String[] dessert = mul.getParameterValues("dessert");

		// 특징과 디저트 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
		String feature2 = "";
		for (int i = 0; i < feature.length; i++) {
			feature2 += feature[i];
			if (i < feature.length - 1) {
				feature2 += ", ";
			}
		}

		String dessert2 = "";
		for (int j = 0; j < dessert.length; j++) {
			dessert2 += dessert[j];
			if (j < dessert.length - 1) {
				dessert2 += ", ";
			}
		}

		String imagesName1 = "";
		for (MultipartFile mf1 : filelist1) {
			String imagefile = mf1.getOriginalFilename(); // 원본 파일명
			imagesName1 += imagefile + " ";
			try {
				mf1.transferTo(new File(imagepath + "\\" + imagefile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		mf2.transferTo(new File(imagepath + "\\" + filelist2));
		StoreDTO dto = new StoreDTO(store_id, storename, tel, address, lineintro, intro, imagesName1, main_menu,
				filelist2, region_name, feature2, dessert2);
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storemodifyfinal(dto);
		return "redirect:/storeoutput?store_id=" + store_id;
	}

	// 매장 삭제 전 비밀번호 확인
	@RequestMapping(value = "/storeleave")
	public String storeleave() {
		return "storeleave";
	}

	@RequestMapping(value = "/storeconfirmLeave")
	public String storeconfirmLeave() {
		return "storeconfirmLeave";
	}

	// 탈퇴하기 전 비밀번호 확인 체킹
	@RequestMapping(value = "/storeleavechecking", method = RequestMethod.POST)
	public String storepwchecking2(HttpServletRequest request) {
		String id = request.getParameter("storeid");
		String pw = request.getParameter("storepw");

		StoreService ss = sqlSession.getMapper(StoreService.class);

		StoreDTO dto = ss.storeleavechecking(id, pw);

		if (dto != null) {
			return "redirect:/storeconfirmLeave";

		} else {
			String alertMessage = "비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "storeloginerr2";
		}
	}

	// 매장 삭제
	@RequestMapping(value = "/storedelete")
	public String storedelete(HttpServletRequest request) {
		String id = request.getParameter("id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.stardelete(id); // 즐겨찾기 삭제
		ss.waitingdelete(id); // 웨이팅 삭제
		ss.ddabongdelete(id); // 따봉 삭제
		ss.reservationdelete(id);
		// 예약 삭제 인데 이거 수정해야 됨 예약테이블에서 업체아이디 갖는 레코드 찾아서 예약번호 가져오고 예약번호 해당하는 리뷰 테이블 삭제하고
		// 그다음 예약테이블 다시 삭제
		ss.registrationdelete(id); // 매장 삭제
		return "redirect:/main";
	}

	// 매장측 예정 예약 현황
	@RequestMapping(value = "/storeStatus", method = RequestMethod.GET)
	public String storeStatus(HttpServletRequest request, Model mo) {
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);

		ArrayList<StoreDTO> ReservationList = ss.storeStatus(store_id);
		mo.addAttribute("ReservationList", ReservationList);
		mo.addAttribute("pass", null);
		return "storeStatus";
	}

	// 매장측 지난 예약 현황
	@RequestMapping(value = "/storeStatusPass", method = RequestMethod.GET)
	public String storeStatuspass(HttpServletRequest request, Model mo) {
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);

		ArrayList<StoreDTO> ReservationList = ss.storeStatusPass(store_id);
		mo.addAttribute("ReservationList", ReservationList);
		mo.addAttribute("pass", "pass");
		return "storeStatus";
	}

	// 매장측 예약 삭제
	@RequestMapping(value = "/storeReservationDelete")
	public String storeReservationDelete(HttpServletRequest request) {
		String reservation_num = request.getParameter("reservation_num");
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);

		ss.storeReviewDelete(reservation_num);
		ss.storeReservationDelete(reservation_num);

		return "redirect:/storeStatus?store_id=" + store_id;
	}

	// 캘린더로 예약 출력
	@RequestMapping(value = "/storecalendar", method = RequestMethod.GET)
	public String store6(HttpServletRequest request, Model mo) {
		String store_id = request.getParameter("store_id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ArrayList<ReservationDTO> list = ss.calendar(store_id);
		mo.addAttribute("list", list);
		request.setAttribute("arr", list);
		return "calendar";
	}

	// 업체용 회원가입
	@RequestMapping(value = "/storeJoin")
	public String storeJoin() {

		return "storeJoin";
	}

	// 업체용 로그인
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

			HttpSession session = request.getSession();
			session.setAttribute("store_id", dto.getStore_id());

			return "redirect:/main";
		} else {
			String alertMessage = "아이디 또는 비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "storeloginerr";
		}
	}

	// 업체정보 들어가기 전 비밀번호 확인
	@RequestMapping(value = "/storepwcheck")
	public String storepwcheck() {

		return "storepwcheck";
	}

	// 업체정보 들어가기 전 비밀번호 확인 체킹
	@RequestMapping(value = "/storepwchecking", method = RequestMethod.GET)
	public String storepwchecking(HttpServletRequest request) {
		String id = request.getParameter("storeid");
		String pw = request.getParameter("storepw");

		StoreService ss = sqlSession.getMapper(StoreService.class);

		StoreDTO dto = ss.storepwchecking(id, pw);

		if (dto != null) {

			return "redirect:/storeoutput?store_id=" + id;
		} else {
			String alertMessage = "비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "storeloginerr2";
		}
	}

	// 업체 로그아웃
	@RequestMapping(value = "/storelogout")
	public String storelogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();

		hs.removeAttribute("store");
		hs.setAttribute("storeloginstate", false);

		return "redirect:/main";
	}

//		비번찾기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 업체용 아이디 및 비번찾기 화면
	@RequestMapping(value = "/storeFind")
	public String storeFind() {
		return "storeFind";
	}

	// 업체용 아이디찾기 화면
	@RequestMapping(value = "/storeidFind")
	public String storeidFind() {
		return "storeidFind";
	}

	// 업체용 아이디찾기 검색결과
	@RequestMapping(value = "/storeidResult", method = RequestMethod.POST)
	public String storeidResult(HttpServletRequest request, Model model) {
		String ceo = request.getParameter("ceo");
		String email = request.getParameter("email");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		list = ss.storeidResult(ceo, email);
		model.addAttribute("list", list);

		return "storeidResult";
	}

	// 업체용 비번찾기 화면
	@RequestMapping(value = "/storepwFind")
	public String storepwFind() {
		return "storepwFind";
	}

	// 업체용 비번찾기 검색결과
	@RequestMapping(value = "/storepwResult", method = RequestMethod.POST)
	public String storepwResult(HttpServletRequest request, Model model) {
		String ceo = request.getParameter("ceo");
		String id = request.getParameter("id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		list = ss.storepwResult(ceo, id);
		model.addAttribute("list", list);

		return "storepwResult";
	}
//		비번찾기 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 업체 회원가입 전송
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