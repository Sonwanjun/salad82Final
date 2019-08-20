package com.icia.salad82final;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.service.AdminManagement;

@Controller
public class AdminController {
	
	@Autowired
	AdminManagement am;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/adminPageMain")
	public ModelAndView goAdminPageMain() {
		
		mav = new ModelAndView();
		mav.setViewName("adminPageMain");
		return mav;
		
	}
	
	@RequestMapping(value = "/sellerInfo")
	public ModelAndView sellerInfo(Integer pNum) {
		
		mav = new ModelAndView();
		mav = am.getSellerInfo(pNum);
		return mav;
		
	}
	
	@RequestMapping(value = "/consumerInfo")
	public ModelAndView consumerInfo(Integer pNum) {
		
		mav = new ModelAndView();
		mav = am.getCustomerInfo(pNum);
		return mav;
		
	}

}
