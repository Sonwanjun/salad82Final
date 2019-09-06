package com.icia.salad82final.dao;


import com.icia.salad82final.bean.Cart;
import com.icia.salad82final.bean.PD;

public interface OrderDao {

	void putTheListCart(Cart cart) throws Exception;


	//List<Cart> getCartShowList(int pageNum);
}
