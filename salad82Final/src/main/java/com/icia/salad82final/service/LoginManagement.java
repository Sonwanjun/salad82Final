package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.icia.salad82final.bean.Login;
import com.icia.salad82final.dao.LoginDao;


@Service
public class LoginManagement {
	@Autowired
	LoginDao lDao;
	
	ModelAndView mav;
	
	@Autowired
	HttpSession session;

	/*
	 * private void hashMapTest(String id, String pwdEncode) { Map<String, String>
	 * hMap = new HashMap<String, String>(); hMap.put("id", id); hMap.put("pw",
	 * pwdEncode); int result = lDao.hashMapTest(hMap);
	 * System.out.println("result = " + result); //로그인 성공 : 1 , 실패 : 0 hMap =
	 * lDao.hashMapTest2(id); System.out.println("name="+hMap.get("C_NAME")); }
	 */

	public ModelAndView access(Login lg) {
		System.out.println("서비스1 : "+lg.getId());
		System.out.println("서비스2 : "+lg.getPwd());
		System.out.println("서비스3 : "+lg.getM_type());
		System.out.println("서비스 : "+lg.getEmail());
		mav = new ModelAndView();
		String view = null;
		//스프링에서는 복호화 안됨
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwdEncode = lDao.getSecurityPwd(lg.getId());
		System.out.println("pwd = "+pwdEncode);
		
		//hashMap Test
		/* hashMapTest(lg.getId(), pwdEncode); */
		
		if(pwdEncode!=null)
		{
			if(pwdEncoder.matches(lg.getPwd(), pwdEncode))
			{
				session.setAttribute("id", lg.getId()); //
				lg=lDao.getMemberInfo(lg.getId());
				session.setAttribute("lg", lg);
				view = "redirect:home"; //forward:url, POST-POST GET-GET만 가능	
				                        //redirect:url, POST,GET --> GET만 가능
			}
			else //비번 오류
			{
				view="login";
				mav.addObject("check","아이디와 비밀번호를 확인해주세요.");
			}
		}
		else   // 아이디 존재 안함 오류
		{
			view="login";
			mav.addObject("check","아이디와 비밀번호를 확인해주세요."); //로그인 실패
		}
		mav.setViewName(view);
		return mav;
	}

	/*
	 * public ModelAndView getMemberType(String type) { mav = new ModelAndView();
	 * String view = null; Login login = lDao.getLoginSuccess(type);
	 * mav.addObject("login", login);
	 * System.out.println("login="+login.getM_type());
	 * 
	 * 
	 * String types = lDao.getMemberType(type);
	 * System.out.println("types="+login.getId()); mav.addObject("types", types);
	 * view = "home"; mav.setViewName(view); return mav; }
	 */
}