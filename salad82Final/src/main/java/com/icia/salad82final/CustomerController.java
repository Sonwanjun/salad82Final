package com.icia.salad82final;


import java.util.Locale;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.service.CustomerManagement;



@Controller
public class CustomerController {
	
	ModelAndView mav;
	
	@Autowired
	private CustomerManagement cm;
	
	@RequestMapping(value = "/customerInsert", method = RequestMethod.POST) //일반 회원가입
	public ModelAndView customerInsert(Customer ct) {
		mav=cm.customerInsert(ct);
		return mav;
	}
	

	@RequestMapping(value = "/cMyPage", method = RequestMethod.GET)  //구매자 마이페이지
	public String sMyPage(Locale locale, Model model) {	
		
		return "cMyPage";
	}

	
	// 회원 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
		 
	 String c_id = req.getParameter("c_id");
	 Customer idCheck = cm.idCheck(c_id);
	 System.out.println("id = "+c_id);
	 int result=0;
	 
	 if(idCheck != null) {
	  result = 1;
	 } 
	 
	 return result;
	}
}