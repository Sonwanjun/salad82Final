package com.icia.salad82final.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.bean.Board;
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

	public ModelAndView getSearchList(Integer pNum,String searchWord) {
		int pageNum= (pNum==null) ? 1 : pNum;
		HashMap <String,Object> param = new HashMap<>();
		param.put("pageNum",pageNum);
		param.put("searchWord",searchWord);
		System.out.println(param);
		List<Board> sbList = bDao.getSearchList(param);
		
		String view= null;
		
		if (sbList != null) {
			view = "myRecipe"; // TODO 다 썼으면 sellerInfo로 바꿀것
			mav.addObject("sbList",sbList);
			mav.addObject("paging", getPaging(pageNum, view));
		} else {
			view = "home";
		}
		mav.setViewName(view);
		return mav;
	}
}
