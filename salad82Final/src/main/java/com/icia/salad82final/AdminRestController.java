package com.icia.salad82final;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.icia.salad82final.service.AdminManagement;

@RestController
@RequestMapping(value = "/ajax", produces = "application/json; charset=UTF-8")
public class AdminRestController {

	@Autowired
	AdminManagement am;

	@RequestMapping(value = "/addFirstCategory")
	public String addFirstCategory(String dbViewName, String category) {
		String jsonStr = am.addFirstCategory(dbViewName, category);
		return jsonStr;
	}

	@RequestMapping(value = "/addSecondCategory")
	public String addSecondCategory(String dbViewName, String category, int cf_code) {
		String jsonStr = am.addSecondCategory(dbViewName, category, cf_code);
		return jsonStr;
	}

}
