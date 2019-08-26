package com.icia.salad82final;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	@RequestMapping(value = "/sellerInsert")
	public ModelAndView sellerInsert(Seller st) {
		mav=sm.sellerInsert(st);
		return mav;
	}

}
