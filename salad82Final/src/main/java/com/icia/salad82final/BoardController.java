package com.icia.salad82final;

import java.util.Locale;

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

	@RequestMapping(value = "/searchList")//
	public ModelAndView searchList(Integer pNum,String searchWord) {
		System.out.println(pNum);
		System.out.println(searchWord);
		
		mav=bm.getSearchList(pNum,searchWord);
		
		return mav;
	
	}

	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public ModelAndView notice(Integer pageNum) {
		mav = bm.getNotice(pageNum);

		return null;

	}

}