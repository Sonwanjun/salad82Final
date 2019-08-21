package com.icia.salad82final;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "redirect:adminPageMain";
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String loginform(Locale locale, Model model) {	
		
		return "loginform";
	}
	@RequestMapping(value = "/sJoinForm", method = RequestMethod.GET)
	public String sJoinForm(Locale locale, Model model) {	
		
		return "sJoinForm";
	}
	@RequestMapping(value = "/cJoinForm", method = RequestMethod.GET)
	public String nJoinForm(Locale locale, Model model) {	
		
		return "cJoinForm";
	}
}
