package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Board;
import com.icia.salad82final.bean.Category;
import com.icia.salad82final.dao.BoardDao;
import com.icia.salad82final.userClass.PagingForAjax;

@Service
public class BoardManagement {
	@Autowired
	BoardDao bDao;

	ModelAndView mav;

	public ModelAndView getBoardList(Integer pNum) { // 게시판리스트 페이지 출력용. 상세페이지 아님

		mav = new ModelAndView();
		String view = null;
		List<Board> bList = null;
		int pageNum = (pNum == null) ? 1 : pNum;

		bList = bDao.getBoardList(pageNum);

		if (bList != null) {
			view = "myRecipe"; // TODO 다 썼으면 sellerInfo로 바꿀것
			mav.addObject("bList", bList);
			mav.addObject("paging", getPaging(pageNum, view));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
		// TODO 게시판상세 추후 추가
	}

	private String getPaging(int pNum, String infoName) {
		int maxNum = bDao.getBoardCount();
		int listCount = 5;
		int pageCount = 2; // [1].[2]
		String boardName = "boardList";// 게시판 url 여러개일때
		PagingForAjax paging = new PagingForAjax(maxNum, pNum, listCount, pageCount, boardName);

		return paging.makeHtmlPaging();
	}

	public ModelAndView getNotice(Integer pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	public ModelAndView getSearchList(Integer pNum, String searchWord) {
		int pageNum = (pNum == null) ? 1 : pNum;
		HashMap<String, Object> param = new HashMap<>();
		param.put("pageNum", pageNum);
		param.put("searchWord", searchWord);
		System.out.println("asdf");
		System.out.println(param);
		List<Board> sbList = bDao.getSearchList(param);
		System.out.println("asdfsfsdgh");
		String view = null;

		if (sbList != null) {
			view = "myRecipe"; // TODO 다 썼으면 sellerInfo로 바꿀것
			mav.addObject("sbList", sbList);
			mav.addObject("paging", getPaging(pageNum, view));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}

	public ModelAndView boardListCount(Integer pNum) {
		mav = new ModelAndView();
		String view = null;
		List<Board> bcList = bDao.boardListCount(pNum);

		int pageNum = (pNum == null) ? 1 : pNum;

		if (bcList != null) {
			view = "myRecipe";
			mav.addObject("bcList", bcList);
			mav.addObject("paging", getPaging(pageNum, view));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		System.out.println("bcList" + bcList);
		return mav;
	}

	public ModelAndView getCategory() {
		mav = new ModelAndView();
		
		
		List<Category> ccList = bDao.getCategory();//이고슨 대분류 
		System.out.println(ccList.get(0).getCf_name());
		
		for(int i=0; i<ccList.size(); i++) {
			int param = ccList.get(i).getCf_code();//.get(i) 카테고리
			List<Category> temp = bDao.getSmallCategory(param);
			switch(ccList.get(i).getCf_code()) {
			case 1 : mav.addObject("meat", temp);
				break;
			case 2 : mav.addObject("fish", temp);
				break;
			case 3 : mav.addObject("milk", temp);
				break;
			case 4 : mav.addObject("veg", temp);
				break;
			}
		}
		
		//소분류만불러오기
		mav.addObject("ccList",ccList); //여기는 메소드 넣는곳 <+....>같은거 넣으면 안됨
		return mav;
	}
}
