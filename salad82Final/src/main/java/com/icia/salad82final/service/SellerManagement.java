package com.icia.salad82final.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.PD;
import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.dao.SellerDao;

@Service
public class SellerManagement {
	@Autowired
	private SellerDao sDao;
	
	ModelAndView mav;
	
	@Autowired
	HttpSession session;
	
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

	public ModelAndView getsMyPage(Integer sl) {
		if(session.getAttribute("id")!=null) {
			mav=new ModelAndView();
			String view=null;
			List<Seller> sList=null;
			
			int sNum=(sl==null) ? 1 : sl;
			sList=sDao.getsMyPage(sNum);
			mav.addObject("sList", sList);
			if(sList!=null) {
				view="sMyPage";
				mav.addObject("sList", sList);
			}else {
				view="home";
			}
		mav.setViewName(view);	
		}
		return mav;
	}  //sMyPage End
	
	public void productCreate(PD pd, HttpServletRequest req) throws Exception{
		//HttpSession session = req.getSession();
		//pd.setS_id((String)session.getAttribute("id"));
		pd.setS_id("SELLER5");
		pd.setP_type("P");
		sDao.productCreate(pd);
	}


}
