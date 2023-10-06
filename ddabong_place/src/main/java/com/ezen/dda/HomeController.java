package com.ezen.dda;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	@RequestMapping(value = "/main") 
	public String monthDDA() {
		return "redirect:/";
	}
	
}
