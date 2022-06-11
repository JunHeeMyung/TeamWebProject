package com.zumuniyo.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/review/*")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("프론트 서블렛 Uri = "+uri);
		
		
		String page = "";
		Command command = null;
		
		if(uri.equals("/review/reviewAllList.do")) {		
			command = new ReviewSelectController();
		}else if(uri.equals("/review/reviewInsert.do")) {		
			command = new ReviewInsertController();			
		}else if(uri.equals("/review/reviewShop.do")) {		
			command = new ReviewShopController();
		}else if(uri.equals("/review/reviewMenu.do")) {		
			command = new ReviewMenuController();
		}else if(uri.equals("/review/reviewUpdate.do")) {		
			command = new ReviewUpdateController();
		}else if(uri.equals("/review/reviewDelete.do")) {		
			command = new ReviewDeleteController();
			
			
		}else if(uri.equals("/review/test")) {		
			command = new TestController();
		}
		
		
		
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);;
			return;
		}
		
		System.out.println("FS_uri : " + uri);
		page = command.execute(request);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
    
	
   
}
