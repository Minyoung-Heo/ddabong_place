package com.ezen.dda.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class StoreController {

	@Autowired
	SqlSession sqlSession;
	//각자 이미지 폴더 위치 넣기
	static String imagepath = "C:\\Users\\pyo66\\ddabong_place\\ddabong_place\\src\\main\\webapp\\image";
	ArrayList<StoreDTO> list = new ArrayList<StoreDTO>();
	
	//회원용 로그인 화면
	@RequestMapping(value = "/storeLogin")
	public String storeLogin() {
		return "storeLogin";
	}
	//회원용 회원가입 화면
	@RequestMapping(value = "/storeJoin")
	public String storeJoin() {
		return "storeJoin";
		}
			
	//storeinput 입력창
	@RequestMapping(value = "/storeinput")
	public String store1() {
		return "storeinput";
	}

	// storeinput 입력창에서 입력 후 db 저장
	@RequestMapping(value = "/storeinputsave", method = RequestMethod.POST)
	public String store2(MultipartHttpServletRequest mul, HttpSession session) {
		
		String store_id =(String) session.getAttribute("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("address");
		String lineintro = mul.getParameter("lineintro");
		String intro = mul.getParameter("intro");
		// 이미지 다중 파일 업로드
		List<MultipartFile> filelist = mul.getFiles("image");
		
		
//		MultipartFile mf1 = mul.getFile("image");
//		String imagefile = mf1.getOriginalFilename();
		String main_menu = mul.getParameter("main_menu");
//		MultipartFile mf2 = mul.getFile("main_image");
//		String mainimagefile = mf2.getOriginalFilename();
		String region_name = mul.getParameter("region_name");
		String [] feature = mul.getParameterValues("feature");
		String [] dessert = mul.getParameterValues("dessert");
		
		
		//특징과 디저트 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
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
		
		for (MultipartFile mf1 : filelist) {
			String originfilename = mf1.getOriginalFilename(); //원본 파일명
			
			String safefile = imagepath + System.currentTimeMillis() + originfilename;
			
			try {
				mf1.transferTo(new File(safefile));
			}catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//mf1.transferTo(new File(imagepath+"\\"+imagefile));
		//mf2.transferTo(new File(imagepath+"\\"+mainimagefile));
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storeinput(store_id,storename,tel,address,lineintro,intro,filelist,main_menu,region_name,feature2,dessert2);
		//ss.storeinput(store_id,storename,tel,address,lineintro,intro,/*imagefile*/,main_menu,mainimagefile,region_name,feature2,dessert2);
		
		
		/*
		 * // "image" 및 "main_image" 필드에 대한 여러 이미지 처리 
		 * List<MultipartFile> imageFiles = mul.getFiles("image");
		 * List<MultipartFile> mainImageFiles = mul.getFiles("main_image");
		 * 
		 * // 각 이미지 파일을 별도로 처리 
		 * for (MultipartFile imageFile : imageFiles) { 
		 * String imageFileName = imageFile.getOriginalFilename(); // 필요한 대로 이미지를 저장하거나 처리합니다.
		 * }
		 * 
		 * for (MultipartFile mainImageFile : mainImageFiles) { 
		 * String mainImageFileName = mainImageFile.getOriginalFilename(); // 필요한 대로 대표 메뉴 이미지를 저장하거나 처리합니다. }
		 */
	    
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
	
	//storemodifyview 수정창
	@RequestMapping(value = "/storemodifyview")
	public String store4(Model md) {
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ArrayList<StoreDTO> list = ss.storemodifyview();
		md.addAttribute("list", list);
		
		return "storemodify";
	}
	
	@RequestMapping(value = "/storemodifysave", method = RequestMethod.POST)
	public String store5(MultipartHttpServletRequest mul, HttpSession session) {
		String store_id =(String) session.getAttribute("store_id");
		String storename = mul.getParameter("storename");
		String tel = mul.getParameter("tel");
		String address = mul.getParameter("address");
		String lineintro = mul.getParameter("lineintro");
		String intro = mul.getParameter("intro");
		//이미지 다중 파일 업로드
		List<MultipartFile> filelist1 = mul.getFiles("image");
		String main_menu = mul.getParameter("main_menu");
		//이미지 다중 파일 업로드
		List<MultipartFile> filelist2 = mul.getFiles("main_image");
		String region_name = mul.getParameter("region_name");
		String [] feature = mul.getParameterValues("feature");
		String [] dessert = mul.getParameterValues("dessert");
		
		
		//특징 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
		String feature2 = "";
		for (int i = 0; i < feature.length; i++) {
		    feature2 += feature[i];
		    if (i < feature.length - 1) {
		        feature2 += ", ";
		    }
		}
		
		//디저트 체크박스 중복 선택 가능하게 하기, 중복 선택 했을시 마지막 , 빼기
		String dessert2 = "";
		for (int j = 0; j < dessert.length; j++) {
			dessert2 += dessert[j];
		    if (j < dessert.length - 1) {
		    	dessert2 += ", ";
		    }
		}
		
		for (MultipartFile mf1 : filelist1) {
			String originfilename1 = mf1.getOriginalFilename(); //원본 파일명
			
			String safefile1 = imagepath + System.currentTimeMillis() + originfilename1;
			
			try {
				mf1.transferTo(new File(safefile1));
			}catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			
		for (MultipartFile mf2 : filelist2) {
			String originfilename2 = mf2.getOriginalFilename(); //원본 파일명
				
			String safefile2 = imagepath + System.currentTimeMillis() + originfilename2;
				
			try {
				mf2.transferTo(new File(safefile2));
			}catch (IllegalStateException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
		
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.storemodifyfinal(store_id,storename,tel,address,lineintro,intro,filelist1,main_menu,filelist2,region_name,feature2,dessert2);
		
		return "redirect:storeoutput";
	}
	
	//storestatus 캘린더
	@RequestMapping(value = "/storestatus")
	public String store6() {
			
		return "storestatus";
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

			return "redirect:/";
		} else {
			String alertMessage = "아이디 또는 비밀번호를 다시 확인해주세요";
			request.setAttribute("alertMessage", alertMessage);

			return "storeloginerr";
		}
	}

	// 업체 로그아웃
	@RequestMapping(value = "/storelogout")
	public String storelogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();

		hs.removeAttribute("store");
		hs.setAttribute("storeloginstate", false);

		return "redirect:/";
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
	// 업체용 store가입 화면
	@RequestMapping(value = "/storeJoin")
	public String storeJoin() {
		return "storeJoin";
	}
	

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