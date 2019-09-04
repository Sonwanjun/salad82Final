package com.icia.salad82final.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.icia.salad82final.bean.Board;
import com.icia.salad82final.bean.Category;

public interface BoardDao {

	
	List<Board> getSearchList(HashMap<String, Object> param);

	int getBoardCount();

	List<Board> getBoardList(int pageNum);

	List<Board> boardListCount(Integer pNum);

	List<Category> getCategory();

	List<Category> getSmallCategory(int param);

	


}