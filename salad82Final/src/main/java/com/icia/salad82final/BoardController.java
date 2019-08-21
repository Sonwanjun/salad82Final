package com.icia.salad82final;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "/myRecipe", method = RequestMethod.GET)
	public String myRecipe(Locale locale, Model model) {
		return "myRecipe";
	}
}