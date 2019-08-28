package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.ModelAndView;



public class LoginManagement {


	/*
	 * private void hashMapTest(String m_id, String pwdEncode) { Map<String, String>
	 * hMap = new HashMap<String, String>(); hMap.put("id", m_id); hMap.put("pw",
	 * pwdEncode); int result = mDao.hashMapTest(hMap);
	 * System.out.println("result = " + result); //로그인 성공 : 1 , 실패 : 0 hMap =
	 * mDao.hashMapTest2(m_id); System.out.println("name="+hMap.get("M_NAME"));
	 * System.out.println("name="+hMap.get("G_NAME")); }
	 * 
	 * public ModelAndView access(Member mb) { mav = new ModelAndView(); String view
	 * = null; //스프링에서는 복호화 안됨 BCryptPasswordEncoder pwdEncoder = new
	 * BCryptPasswordEncoder(); String pwdEncode =
	 * mDao.getSecurityPwd(mb.getM_id()); System.out.println("pwd = "+pwdEncode);
	 * 
	 * //hashMap Test hashMapTest(mb.getM_id(), pwdEncode);
	 * 
	 * if(pwdEncode!=null) { if(pwdEncoder.matches(mb.getM_pwd(), pwdEncode)) {
	 * session.setAttribute("id", mb.getM_id()); //
	 * mb=mDao.getMemberInfo(mb.getM_id()); //mav.addObject("mb",mb);
	 * session.setAttribute("mb", mb); view = "redirect:boardList"; //forward:url,
	 * POST-POST GET-GET만 가능 //redirect:url, POST,GET --> GET만 가능 } else //비번 오류 {
	 * view="home"; mav.addObject("check",2); } } else // 아이디 존재 안함 오류 {
	 * view="home"; mav.addObject("check", 2); //로그인 실패 } mav.setViewName(view);
	 * return mav; }
	 */
}