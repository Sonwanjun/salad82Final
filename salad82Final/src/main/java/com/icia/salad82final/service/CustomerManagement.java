package com.icia.salad82final.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.dao.CustomerDao;

@Component
public class CustomerManagement {

	@Autowired
	private CustomerDao cDao;
	
	ModelAndView mav;
	
	
	public ModelAndView customerInsert(Customer ct) {
		mav = new ModelAndView();
		String view = null; //비번을 암호화(Encoding) 할수 있지만 복호화(Decoding)는 불가능
		/*
		 * BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //비번을 암호화한
		 * 코드로 변환해서 저장 ct.setC_pwd(pwdEncoder.encode(ct.getC_pwd()));
		 */
		if(cDao.customerInsert(ct))
		{
			view="home";
			mav.addObject("check",1); //회원가입 성공
			System.out.println("success");
		}
		else
		{
			view="cJoinForm";
			mav.addObject("check",2);
			System.out.println("fail");
		}
		mav.setViewName(view);
		return mav;
	}
}
