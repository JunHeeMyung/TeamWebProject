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
		
		if(uri.equals("/review/reviewAllList")) {		
			command = new ReviewSelectController();
		}else if(uri.equals("/review/reviewInsert")) {		
			command = new ReviewInsertController();
		}else if(uri.equals("/review/reviewShop")) {		
			command = new ReviewShopController();
			
		}
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);;
			return;
		}
		/*
		if(uri.equals("/emp/emplist.do")) {
			command = new ();
		}else if(uri.equals("/emp/empInsert.do")){
			command = new ();			
		}else if(uri.equals("/emp/empDetail.do")){
			command = new ();
		}else if(uri.equals("/emp/empDelete.do")){
			command = new ();			
		}
		*/
		System.out.println("FS_uri : " + uri);
		page = command.execute(request);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
    
	
   
}
