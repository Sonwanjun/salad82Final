package com.icia.salad82final;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.service.AdminManagement;

@Controller
public class AdminController {
	
	@Autowired
	AdminManagement am;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/adminPageMain")
	public ModelAndView adminPageMain() {
		
		mav = new ModelAndView();
		mav.setViewName("adminPageMain");
		return mav;
		
	}
	
	@RequestMapping(value = "/sellerInfo")
	public ModelAndView sellerInfo(Integer pNum) {
		
		mav = am.getSellerInfo(pNum);
		return mav;
		
	}
	
	@RequestMapping(value = "/consumerInfo")
	public ModelAndView consumerInfo(Integer pNum) {
		
		mav = am.getCustomerInfo(pNum);
		return mav;
		
	}
	
	@RequestMapping(value = "/selledProdInfo")
	public ModelAndView selledProdInfo(String s_id) { 
		//[ajax로 전달하는 js객체의 이름부분=전달받는 메소드의 인수 이름]이어야 값이 제대로 받아짐 
		
		System.out.println("s_id = " + s_id);
		
		//mav = am.getSelledProdInfo(s_id); //만들어야한다
		return mav;
		
	}

}
