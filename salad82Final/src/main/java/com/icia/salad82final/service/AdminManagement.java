package com.icia.salad82final.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.dao.AdminDao;
import com.icia.salad82final.userClass.Paging;

@Service
public class AdminManagement {

	@Autowired
	AdminDao aDao;
	
	ModelAndView mav;

	public ModelAndView getSellerInfo(Integer pNum) { //판매자정보 페이지 출력용. 상세페이지 아님

		mav = new ModelAndView();
		String view = null;
		List<Seller> sList = null;
		int pageNum = (pNum == null) ? 1 : pNum;
		
		sList = aDao.getSellerInfo(pageNum);
		if(sList != null) {
			view = "sellerInfo";
			mav.addObject("sList", sList);
			mav.addObject("paging", getPaging(pageNum, view, "S_SHORT"));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
		
	}

	public ModelAndView getCustomerInfo(Integer pNum) {

		mav = new ModelAndView();
		String view = null;
		List<Customer> cList = null;
		int pageNum = (pNum == null) ? 1 : pNum;
		
		cList = aDao.getCustomerInfo(pageNum);
		if(cList != null) {
			view = "consumerInfo";
			mav.addObject("cList", cList);
			mav.addObject("paging", getPaging(pageNum, view, "C_SHORT"));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
		
	}
	
	private String getPaging(int pNum, String infoName, String viewName) {
		int maxNum = aDao.getInfoCount(viewName); // 총 글의 갯수
		int listCount = 5;
		int pageCount = 2; // 페이지 선택숫자 출력갯수
		Paging paging = new Paging(maxNum, pNum, listCount, pageCount, infoName);
		return paging.makeHtmlPaging();
	}
}
