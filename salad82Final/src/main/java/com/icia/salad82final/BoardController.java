package com.icia.salad82final;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.salad82final.service.BoardManagement;

@Controller
public class BoardController {

	@Autowired
	BoardManagement bm;

	ModelAndView mav;

	@RequestMapping(value = "/myRecipe", method = RequestMethod.GET)
	public ModelAndView getBoardList(Integer pNum) {

		mav = bm.getBoardList(pNum);

		return mav;

	}

	@RequestMapping(value = "/myRecipeWrite")
	public ModelAndView getWriteFrm() {
		mav = new ModelAndView();
		mav = bm.getCategory();
		mav.setViewName("myRecipeWrite");
		return mav;
	}// 띄우고자 하는 정보가 같은 뷰에(ex:myRecipeWrite.jsp) 있을땐 파라메터 타입이 없을시 굳이 요청 안해도됨
		// DB(SQL)에 있는 정보를 이용할땐 () <== 빈깡통으로 만들어도 됨

	@RequestMapping(value = "/boardListCount")
	public ModelAndView getBoardListCount(Integer pNum) {
		// pageNum = pNum

		System.out.println(pNum);
		mav = bm.boardListCount(pNum);
		return mav;

	}

	@RequestMapping(value = "/searchList") //
	public ModelAndView searchList(Integer pNum, String searchWord) {
		System.out.println(pNum);
		System.out.println(searchWord);

		mav = bm.getSearchList(pNum, searchWord);

		return mav;

	}

	@RequestMapping(value = "/categoryCall", method = RequestMethod.GET)
	public ModelAndView getCategory() {
		System.out.println();
		mav = bm.getCategory();
		return mav;

	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView notice(Integer pageNum) {
		mav = bm.getNotice(pageNum);

		return null;

	}

}