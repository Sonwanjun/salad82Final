package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Customer;
import com.icia.salad82final.bean.Order;
import com.icia.salad82final.bean.PD;
import com.icia.salad82final.bean.Seller;
import com.icia.salad82final.dao.AdminDao;
import com.icia.salad82final.userClass.PagingForAjax;

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
		int maxNum = aDao.getInfoCount(viewName); // 총 항목의 갯수
		int listCount = 5;
		int pageCount = 2; // 페이지 선택숫자 출력갯수
		PagingForAjax paging = new PagingForAjax(maxNum, pNum, listCount, pageCount, infoName);
		return paging.makeHtmlPaging();
	}
	private String getPaging(int pNum, String infoName, int maxnum) {
		int maxNum = maxnum; // 총 항목의 갯수
		int listCount = 5;
		int pageCount = 2; // 페이지 선택숫자 출력갯수
		PagingForAjax paging = new PagingForAjax(maxNum, pNum, listCount, pageCount, infoName);
		return paging.makeHtmlPaging();
	}

	@Transactional
	public ModelAndView getSelledProdInfo(String s_id, Integer pNum) { //판매자정보-상세정보-판매기록용 정보 가져오는 메소드
		
		mav = new ModelAndView();
		String view = null;
		
		Seller infoDetail = aDao.getSellerInfoDetail(s_id); //판매기록 상단용 정보를 담은 빈
		
		int pageNum = (pNum == null) ? 1 : pNum;
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("s_id", s_id);
		param.put("pageNum", pageNum);
		
		List<HashMap<String, Object>> list = aDao.getSelledProdInfo(param); //해당 판매자, 해당 페이지의 판매기록을 가져옴
		//마이바티스에서 숫자를  int가 아닌 object로 받아서 까면 BigDecimal 타입
		
		if(infoDetail!=null && list!=null) {
			view = "selledProdInfo";
			mav.addObject("infoDetail", infoDetail);
			mav.addObject("list", list);
			
			HashMap<String, Object> param2 = new HashMap<String, Object>();
			param2.put("viewName", "S_DETAIL_PROD");
			param2.put("id", s_id);
			int maxNum = aDao.getCountBySid(param2); //해당 판매자의 총 판매건수를 가져옴
			mav.addObject("totalCount", maxNum);
			
			List<Integer> incomes = aDao.getIncomesBySeller(s_id);
			int totalIncome = 0;
			for(int temp : incomes) {
				totalIncome += temp;
			}
			mav.addObject("totalIncome", totalIncome);
			
			mav.addObject("paging", getPaging(pageNum, view, maxNum));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		
		return mav;

	}

	@Transactional
	public ModelAndView getRegProdInfo(String s_id, Integer pNum) {

		mav = new ModelAndView();
		String view = null;
		
		Seller infoDetail = aDao.getSellerInfoDetail(s_id); //해당 판매자의 상세 정보들
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("s_id", s_id);
		param.put("pageNum", pNum);
		List<PD> list = aDao.getRegProdInfo(param); //해당 판매자가 등록한 품목들의 리스트
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getP_type().equals("P")) { //품목 타입이 시그니처라면
				list.get(i).setP_type("시그니처"); //타입명을 시그니처로 바꿔서 저장
			} else {
				list.get(i).setP_type("DIY 재료"); //타입이 시그니처가 아니라면 무조건 재료
			}
		}
		
		if(infoDetail!=null && list!=null) {
			view = "regProdInfo";
			mav.addObject("infoDetail", infoDetail);
			mav.addObject("list", list);
			
			HashMap<String, Object> param2 = new HashMap<String, Object>();
			param2.put("viewName", "REG_PROD");
			param2.put("id", s_id);
			int maxNum = aDao.getCountBySid(param2); //해당 판매자의 등록 품목의 수를 세어온다
			mav.addObject("totalCount", maxNum);
			
			mav.addObject("paging", getPaging(pNum, view, maxNum));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
		
	}

	@Transactional
	public ModelAndView getPurcProdInfo(String c_id, Integer pNum) {
		
		mav = new ModelAndView();
		String view = null;
		
		int pageNum = (pNum == null) ? 1 : pNum;
		
		Customer infoDetail = aDao.getCustomerInfoDetail(c_id); //해당 구매자의 상세 정보 가져오기
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", c_id);
		param.put("pageNum", pageNum);
		List<Order> list = aDao.getPurcProdInfo(param); //해당 구매자, 해당 페이지에 맞는 구매정보 가져오기
		
		if(infoDetail!=null && list!=null) {
			view = "purcProdInfo";
			
			mav.addObject("infoDetail", infoDetail);
			mav.addObject("list", list);
			
			List<Integer> totals = aDao.getCustomerTotals(c_id); //특정 구매자의 주문별 주문총액 리스트
			int totalCount = totals.size(); //구매자의 총 구매건수
			int totalPurcMoney = 0; //구매자의 총 구매액
			for(int i=0; i<totalCount; i++) {
				totalPurcMoney += totals.get(i);
			}
			
			mav.addObject("totalCount", totalCount);
			mav.addObject("totalPurcMoney", totalPurcMoney);
			
			int maxnum = aDao.getCustDetailTotalCount(c_id);
			mav.addObject("paging", getPaging(pageNum, view, maxnum));
		} else {
			view = "home";
		}
		
		mav.setViewName(view);
		
		return mav;
	}
}
