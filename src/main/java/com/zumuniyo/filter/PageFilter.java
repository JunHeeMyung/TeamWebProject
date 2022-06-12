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


@WebFilter("*.do")
public class PageFilter implements Filter {

	
	// 방식 변경필요
    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 로그인/로그아웃시 마지막 페이지로 이동하기위해 저장함
		
		String uri = ((HttpServletRequest)request).getRequestURI();
		String path = ((HttpServletRequest)request).getContextPath();
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		if(!uri.equals(path+"/member/login.do")
		 &&!uri.equals(path+"/member/logout.do")
		 &&!uri.equals(path+"/member/login/sublogin.do")
		 &&!uri.equals(path+"/member/register.do")
		 &&!uri.equals(path+"/member/idcheck.do")
		 &&!uri.equals(path+"/member/nickcheck.do")
		 &&!uri.equals(path+"/member/login/subregister.do")) {
			session.setAttribute("nextpage", uri);
		}
		chain.doFilter(request, response);
	}
}
