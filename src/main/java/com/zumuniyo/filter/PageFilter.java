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

    
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// 로그인시 마지막 페이지로 이동하기위해 저장함
		String uri = ((HttpServletRequest)request).getRequestURI();
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		if(!uri.equals("/member/login.do")
		 &&!uri.equals("/member/logout.do")
		 &&!uri.equals("/member/login/naver.do")) {
			session.setAttribute("nextpage", uri);
		}
		chain.doFilter(request, response);
	}
}
