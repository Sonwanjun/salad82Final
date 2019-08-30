package com.icia.salad82final;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Login;
import com.icia.salad82final.service.LoginManagement;

@Controller
public class LoginController {
	@Autowired
	private LoginManagement lm;
	
	@Autowired
	HttpSession session;

	ModelAndView mav;

	@RequestMapping(value = "/access", method = RequestMethod.POST) // 로그인
	public ModelAndView access(Login lg) {
		System.out.println("컨트롤러1 : "+lg.getId());
		System.out.println("컨트롤러2 : "+lg.getPwd());
		System.out.println("컨트롤러3 : "+lg.getM_type());
		System.out.println("컨트롤러4 : "+lg.getEmail());
		mav = lm.access(lg);
		return mav;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.POST) // 로그아웃
	public String logout() {
		session.invalidate(); // 세션 무효화
		return "home";
	}
	
	/*
	 * @RequestMapping(value = "/memberType") // public ModelAndView
	 * memberType(String type) {
	 * 
	 * mav=lm.getMemberType(type); return mav; }
	 */

}

