package com.zumuniyo.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@WebFilter("*.zmny")
public class PageFilter implements Filter {
	
	// 방식 변경필요
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 로그인/로그아웃시 마지막 페이지로 이동하기위해 저장함
		
		String uri = ((HttpServletRequest)request).getRequestURI();
		/* String queryString = request.gets */
		
		String params ="?";
		boolean isFirstParam= true;
		Map<String,String[]> paramMap = request.getParameterMap();
		for(String key:paramMap.keySet()) {
			if(isFirstParam) {
				isFirstParam=false;
			}else {
				params+="&";
			}
			params+=(key+"="+paramMap.get(key)[0]);
		}
		
		HttpSession session = ((HttpServletRequest)request).getSession();

		session.setAttribute("nextpage", uri+params);

		chain.doFilter(request, response);
	}
}
