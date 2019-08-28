package com.icia.salad82final;

import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Cart;
import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.service.CustomerManagement;

@Controller
public class OrderController {

	@Autowired
	private CustomerManagement cm;
	
	@Autowired 
	 HttpSession session;
	
	ModelAndView mv;
	
	@RequestMapping(value = "/cartHome", method = RequestMethod.GET)  
	public String cartHome(Locale locale, Model model) {	
		
		return "cartHome";
	}
	
	@RequestMapping(value = "/goPaymentList", method = RequestMethod.GET)
	public String goPaymentList(Locale locale, Model model) {

		return "goPaymentList";
	}
	
	@RequestMapping(value = "/orderNow", method = RequestMethod.GET)
	public String orderNow(Locale locale, Model model) {

		return "orderNow";
	}
	
}
