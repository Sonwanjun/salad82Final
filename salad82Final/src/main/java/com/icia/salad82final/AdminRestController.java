package com.icia.salad82final;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.icia.salad82final.service.AdminManagement;

@RestController
@RequestMapping(value = "/ajax")
public class AdminRestController {
	
	@Autowired
	AdminManagement am;
											//produces 속성을 이렇게 지정하지 않으면 json을 리턴했을 때 한글이 깨짐
	@RequestMapping(value = "/addCategory", produces = "application/json; charset=UTF-8")
	public @ResponseBody String addCategory(String dbViewName, String category) {
		
		String jsonStr = am.addCategory(dbViewName, category);
		
		return jsonStr;
		
	}

}
