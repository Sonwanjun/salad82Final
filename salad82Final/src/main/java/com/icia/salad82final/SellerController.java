package com.icia.salad82final;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.service.SellerManagement;

@Controller
public class SellerController {
	
	ModelAndView mav;
	
	@Autowired
	private SellerManagement sm;
	

	@RequestMapping(value = "/sMyPage", method = RequestMethod.GET)  //판매자 마이페이지
	public String sMyPage(Locale locale, Model model) {	
		
		return "sMyPage";
	}
	@RequestMapping(value = "/ingredient", method = RequestMethod.GET)  //재료관리
	public String ingredient(Locale locale, Model model) {	
		
		return "ingredient";
	}
	@RequestMapping(value = "/myproductList", method = RequestMethod.GET)  //상품관리
	public String myproductList(Locale locale, Model model) {	
		
		return "myproductList";
	}
	@RequestMapping(value = "/productStatus", method = RequestMethod.GET)  //주문현황
	public String productStatus(Locale locale, Model model) {	
		
		return "productStatus";
	}
	@RequestMapping(value = "/productSale", method = RequestMethod.GET)  //판매실적
	public String productSale(Locale locale, Model model) {	
		
		return "productSale";
	}
	@RequestMapping(value = "/requestHome", method = RequestMethod.GET)  //재료요청
	public String requestHome(Locale locale, Model model) {	
		
		return "requestHome";
	}
	@RequestMapping(value = "/sellerInsert")
	public ModelAndView sellerInsert(Seller st) {
		mav=sm.sellerInsert(st);
		return mav;
	}
			
}
