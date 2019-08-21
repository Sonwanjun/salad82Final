package com.icia.salad82final;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {

	@RequestMapping(value = "/cMyPage", method = RequestMethod.GET)  //구매자 마이페이지
	public String sMyPage(Locale locale, Model model) {	
		
		return "cMyPage";
	}
	
	@RequestMapping(value = "/cartHome", method = RequestMethod.GET)  
	public String cartHome(Locale locale, Model model) {	
		
		return "cartHome";
	}
}