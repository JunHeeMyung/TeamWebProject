package com.zumuniyo.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class EncodeFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// contextPath 설정
		HttpSession session = ((HttpServletRequest)request).getSession();		
		session.setAttribute("path",((HttpServletRequest)request).getContextPath()); 
		
		// 인코딩설정
		request.setCharacterEncoding("utf-8");
		chain.doFilter(request, response);
		
	}

}