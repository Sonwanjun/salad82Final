package com.icia.salad82final.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.dao.SellerDao;

@Service
public class SellerManagement {
	@Autowired
	private SellerDao sDao;
	
	ModelAndView mav;
	
	public ModelAndView sellerInsert(Seller st) {
		mav = new ModelAndView();
		
		String view =null;
		if(sDao.sellerInsert(st))
	      {
	         view ="home";
	         mav.addObject("check",1); //회원가입 성공
	         System.out.println("success");
	      }
	      else
	      {
	         view="sJoinForm";
	         mav.addObject("check",2);
	         System.out.println("fail");
	      }
	      mav.setViewName(view);
	      return mav;
	   }

}
