package com.ezen.dda.search;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.dda.personalfunction.RegistrationDTO;

@Controller
public class SearchController {
	@Autowired
	SqlSession sqlSession;
	
	//검색기능 메소드.
	@RequestMapping(value = "/search")
	public String search(@RequestParam("searchValue") String searchValue, Model mo) {
		String searchValue2 = "%"+searchValue+"%";
		Service ss=sqlSession.getMapper(Service.class);
		
		ArrayList<SearchDTO> storelist=ss.storesearch(searchValue2);
		ArrayList<SearchDTO> regionlist=ss.regionsearch(searchValue2);
		
		// 이미지 파일명을 처리하여 imageList에 저장
		for (SearchDTO SearchDTO : storelist) {
			String image = SearchDTO.getImage(); // dto의 이미지 데이터를 image에 저장.

			// image가 null이거나 비어있을경우가 아닐때 imageFileNames에 콤마와 공백을 기준으로 배열저장.
			if (image != null && !image.isEmpty()) {
				String[] imageFileNames = image.split("[,\\s]+");

				// imageFileNames를 리스트화 시키고 ArrayList에 집어넣은 imageList를 만들고 DTO의 imagelist 배열에
				// 저장.
				List<String> imageList = new ArrayList<>(Arrays.asList(imageFileNames));
				SearchDTO.setImageList(imageList);
			}
		}
		
		mo.addAttribute("storelist", storelist);
		mo.addAttribute("regionlist", regionlist);
		mo.addAttribute("searchValue", searchValue);
		return "searchList";
	}
}
