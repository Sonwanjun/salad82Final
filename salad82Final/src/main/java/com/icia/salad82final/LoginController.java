package com.icia.salad82final;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.service.CustomerManagement;


public class LoginController {


	  @Autowired 
	  HttpSession session;
	  
	  ModelAndView mav;
	  
	  @Autowired 
	  CustomerManagement cm;
	  
	  @RequestMapping(value = "/access", method = RequestMethod.POST) //로그인
	  public ModelAndView access(Customer ct) {
		  mav = cm.access(ct);
		  return mav;
		  }
	  
	  @RequestMapping(value = "/logout", method = RequestMethod.POST) //로그아웃
	  public String logout() { 
		  session.invalidate(); //세션 무효화 
		  return "home";
		  }
	  

  
}
