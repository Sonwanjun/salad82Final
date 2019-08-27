package com.icia.salad82final.dao;

import java.util.List;

import com.icia.salad82final.bean.Board;

public interface BoardDao {

	List<Board> getBoardList(int pageNum);

	int getBoardCount();

}
