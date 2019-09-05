package com.icia.salad82final;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.icia.salad82final.service.AdminManagement;

@Controller
public class AdminController {
	
	@Autowired
	AdminManagement am;
	
	ModelAndView mav;
	
	@RequestMapping(value = "/adminPageMain")
	public String adminPageMain() {	
		
		return "adminPageMain";
		
	}
	
	@RequestMapping(value = "/sellerInfo")
	public ModelAndView sellerInfo(Integer pNum) {
		
		mav = am.getSellerInfo(pNum);
		return mav;
		
	}
	
	@RequestMapping(value = "/consumerInfo")
	public ModelAndView consumerInfo(Integer pNum) {
		
		mav = am.getCustomerInfo(pNum);
		return mav;
		
	}
	
	@RequestMapping(value = "/selledProdInfo")
	public ModelAndView selledProdInfo(String s_id, Integer pNum) { 
		//[ajax로 전달하는 js객체의 이름부분=전달받는 메소드의 인수 이름]이어야 값이 제대로 받아짐 
		
		System.out.println("s_id = " + s_id);
		
		mav = am.getSelledProdInfo(s_id, pNum); //만들어야한다
		return mav;
	}
	
	@RequestMapping(value = "/regProdInfo")
	public ModelAndView getRegProdInfo(String s_id, Integer pNum) {
		mav = am.getRegProdInfo(s_id, pNum);
		return mav;
	}
	
	@RequestMapping(value = "/purcProdInfo")
	public ModelAndView getPurcProdInfo(String c_id, Integer pNum) {
		mav = am.getPurcProdInfo(c_id, pNum);
		return mav;
	}
	
	@RequestMapping(value = "/ingredientCategory")
	public ModelAndView getIngrCategoryInfo() {
		mav = am.getIngrCategoryInfo();
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/deleteIngrCategory")
	public String deleteIngrCategory(String json, String dbViewName) {

		List<Integer> codes = new Gson().fromJson(json, List.class); //삭제할 분류코드를 json → 리스트 변환
		
		am.deleteIngrCategory(codes, dbViewName);
		
		return "forward:ingredientCategory";
	}
	
	@RequestMapping(value = "/productManage")
	public String productManage() {
		return "productManage";
	}
	
	// 암호화 되지 않은 비밀번호 암호화
	/*
	 * @RequestMapping(value = "/pwdChange") public String change(String table) {
	 * am.pwdChange(table); return table; }
	 */

}
