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

	@RequestMapping(value = "/myRecipe", method =RequestMethod.GET)
	public ModelAndView getBoardList(Integer pNum) {
		
		mav = bm.getBoardList(pNum);
		
		return mav;
		
	}
}