package com.icia.salad82final;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.icia.salad82final.dao.SellerDao;
import com.icia.salad82final.service.SellerManagement;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SellerController {
	
	private static final Logger logger = LoggerFactory.getLogger(SellerController.class);
	

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
			
}
