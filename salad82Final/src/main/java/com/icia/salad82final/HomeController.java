package com.icia.salad82final;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.service.CustomerManagement;

@Controller
public class HomeController {
	
	ModelAndView mav;
	
	@Autowired
	private CustomerManagement cm;
	
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
	@RequestMapping(value = "/cJoinForm")
	public ModelAndView cJoinForm(Customer ct) {	
		mav = new ModelAndView();
		mav.setViewName("cJoinForm");
		return mav;
	}
	
	@RequestMapping(value = "/customerInsert", method = RequestMethod.POST)
	public ModelAndView customerInsert(Customer ct) {
		mav=cm.customerInsert(ct);
		System.out.println("왓더퍽");
		return mav;
	}
}
