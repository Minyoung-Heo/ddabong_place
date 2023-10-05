package com.ezen.dda.search;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		mo.addAttribute("storelist", storelist);
		mo.addAttribute("regionlist", regionlist);
		return "searchList";
	}
}
