package com.icia.salad82final.dao;

import com.icia.salad82final.bean.Login;

public interface LoginDao {

	String getSecurityPwd(String id);

	Login getMemberInfo(String id);


}
