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

import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.service.SellerManagement;

/**
 * Handles requests for the application home page.
 */
@Controller
public class SellerController {
	
	@Autowired
	private SellerManagement sm;
	
	ModelAndView mav;
		

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
