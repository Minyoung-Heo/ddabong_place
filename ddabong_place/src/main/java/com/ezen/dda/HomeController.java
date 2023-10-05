package com.ezen.dda;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String main() {
		return "main";
	}

	@RequestMapping(value = "/main")
	public String main1() {
		return "main";
	}

	

}
