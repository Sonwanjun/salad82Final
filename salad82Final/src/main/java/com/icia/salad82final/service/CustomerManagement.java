package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	HttpSession session;

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

	public Customer idCheck(String c_id) throws Exception{
		return cDao.idCheck(c_id);
	}
	
	private void hashMapTest(String c_id, String pwdEncode) {
		Map<String, String> hMap = new HashMap<String, String>();
		hMap.put("id", c_id);
		hMap.put("pw", pwdEncode);
		int result = cDao.hashMapTest(hMap);
		System.out.println("result = " + result); //로그인 성공 : 1 , 실패 : 0
		hMap = cDao.hashMapTest2(c_id);
		System.out.println("name="+hMap.get("M_NAME"));
		System.out.println("name="+hMap.get("G_NAME"));
	}

	public ModelAndView access(Customer ct) {
		mav = new ModelAndView();
		String view = null;
		//스프링에서는 복호화 안됨
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwdEncode = cDao.getSecurityPwd(ct.getC_id());
		System.out.println("pwd = "+pwdEncode);
		
		//hashMap Test
		hashMapTest(ct.getC_id(), pwdEncode);
		
		if(pwdEncode!=null)
		{
			if(pwdEncoder.matches(ct.getC_pwd(), pwdEncode))
			{
				session.setAttribute("id", ct.getC_id()); //
				ct=cDao.getCustomerInfo(ct.getC_id());
				session.setAttribute("ct", ct);
				view = "redirect:home"; //forward:url, POST-POST GET-GET만 가능
				                              //redirect:url, POST,GET --> GET만 가능
			}
			else //비번 오류
			{
				view="login";
				mav.addObject("check",2);
			}
		}
		else   // 아이디 존재 안함 오류
		{
			view="login";
			mav.addObject("check", 3); //로그인 실패
		}
		mav.setViewName(view);
		return mav;
	}

	
}
