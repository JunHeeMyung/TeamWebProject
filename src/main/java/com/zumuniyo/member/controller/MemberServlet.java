package com.zumuniyo.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.common.Command;

@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String method = request.getMethod();
		/* System.out.println("요청:"+uri+":"+method); */
		String page = "";
		Command command = null;
		
		if(uri.equals("/member/register.do")&&method.equals("POST")) {
			command = new RegisterController();
		}else if(uri.equals("/member/idcheck.do")&&method.equals("GET")){
			command = new IdcheckController();
		}else if(uri.equals("/member/nickcheck.do")&&method.equals("GET")){
			command = new NickcheckController();
		}else if(uri.equals("/member/login.do")&&method.equals("POST")){
			command = new LoginController();
		}else if(uri.equals("/member/login.do")&&method.equals("GET")){
			command = new LoginPageController();
		}
		
		if(command==null) {
			response.sendRedirect("/error");
			return;
		}
		
		page = command.execute(request);
		
		if(page.indexOf("json:")>=0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(page.substring(5));
		}else {
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

}
