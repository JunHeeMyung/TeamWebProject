package com.zumuniyo.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.review.controller.Command;


/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/mypage/*")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("mypage 프론트 서블렛 Uri = "+uri);
		
		
		String page = "";
		Command command = null;
		
		
		if(uri.equals("/mypage/mypageFist.do")) {		
			command = new MypageFirstController();				
		}	
		
		
		
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);;
			return;
		}
		
		System.out.println("FS_mypage uri : " + uri);
		page = command.execute(request);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
    
}
       
   
