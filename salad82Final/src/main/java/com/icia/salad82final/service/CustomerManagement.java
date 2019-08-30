package com.icia.salad82final.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.dao.CustomerDao;

@Service
public class CustomerManagement {
	
	@Autowired
	private CustomerDao cDao;
	
	ModelAndView mav;
	
	@Autowired
	HttpSession session;

	   public ModelAndView customerInsert(Customer ct) {
		      mav = new ModelAndView();
		      String view = null; //비번을 암호화(Encoding) 할수 있지만 복호화(Decoding)는 불가능
		      
		       BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder(); //비번을 암호화한 코드로 변환해서 저장 
		       ct.setC_pwd(pwdEncoder.encode(ct.getC_pwd()));
		       
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
	   
	public Customer idCheck(String c_id) throws Exception{
		return cDao.idCheck(c_id);
	}
}
