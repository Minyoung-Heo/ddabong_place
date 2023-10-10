package com.ezen.dda.qna;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnAController {
	
	@RequestMapping(value="/qnaform")
	public String goQnA() {
		return "qnaForm";
	}
	
	
}
