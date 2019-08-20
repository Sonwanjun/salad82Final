package com.icia.salad82final.userClass;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Autowired
	private HttpSession session;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("인터셉터");
        if(request.getSession().getAttribute("id") == null ){
	        response.sendRedirect("./"); // '/'만 쓰면 루트 디렉토리를, 앞에 점을 붙이면 현재 디렉토리를 의미함 
	        return false;
        }
        return true;
    }

	
	/*@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
		modelAndView.addObject("msg", "postHandle!!");
	}*/
}
