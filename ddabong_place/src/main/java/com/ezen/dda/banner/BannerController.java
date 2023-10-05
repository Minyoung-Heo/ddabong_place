package com.ezen.dda.banner;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BannerController {

	@RequestMapping(value = "/quiz")
	public String caferecommend()
	{
		return "quiz";
	}
	
}
