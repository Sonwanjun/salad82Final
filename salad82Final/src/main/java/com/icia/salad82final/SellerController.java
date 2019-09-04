package com.icia.salad82final;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.PD;
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
	@RequestMapping(value = "/sellerInsert")
	public ModelAndView sellerInsert(Seller st) {
		mav=sm.sellerInsert(st);
		return mav;
	}
	@RequestMapping(value = "/sellerList", method = RequestMethod.GET)
	public ModelAndView sellerList(Integer sl) {
		mav=sm.getsMyPage(sl);
		
		return mav;
	}
	
	@RequestMapping(value = "/myproductList", method = RequestMethod.GET)  //상품등록페이지 제작중,,
	public String myproductList(Locale locale, Model model) {	
		
		return "/myproductList";
	}
	
	@RequestMapping(value = "/sproductCreate", method = RequestMethod.GET)  //잡리스트에는 있떤데 필요한지?,,
	public String sproductCreate(Locale locale, Model model) {	
		
		return "/sproductCreate";
	}
	
	@RequestMapping(value = "/ingredient", method = RequestMethod.GET)  //재료관리,,
	public String ingredient(Locale locale, Model model) {	
		
		return "/ingredient";
	}
	
	@RequestMapping(value = "/myproductList", method = RequestMethod.POST)
	public String productCreate(PD pd, HttpServletRequest req) throws Exception{
		sm.productCreate(pd, req);
		
		return "/sproductCreate";
		
	}
	
	
}
