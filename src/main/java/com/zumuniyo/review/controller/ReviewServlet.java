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
		
		
		//JSON 리턴하는 컨트롤러
		//Select
		if(uri.equals("/review/SelectMem.do")) {		
			command = new ReviewSelectMemJSON();
		}else if(uri.equals("/review/SelectShop.do")) {		
			command = new ReviewSelectShopJSON();
		}else if(uri.equals("/review/SelectMenu.do")) {		
			command = new ReviewSelectMenuJSON();
		}
		
		
		
		//성공여부 JSON으로 반환하는 컨트롤러
		//Insert
		else if(uri.equals("/review/Insert.do")) {		
			command = new ReviewInsert();
		}
		//Update
		else if(uri.equals("/review/Update.do")) {		
			command = new ReviewUpdate();
		}
		
		//Delete
		else if(uri.equals("/review/Delete.do")) {		
			command = new ReviewDelete();
		}
		
		
		
		
		
		
		
		// JSP 리턴하는 컨트롤러
		else if(uri.equals("/review/reviewAllList.do")) {		
			command = new ReviewSelectController();
		}else if(uri.equals("/review/revieMemList.do")) {		
			command = new ReviewSelectByMemController();
		}else if(uri.equals("/review/reviewShopList.do")) {
			command = new ReviewSelectByShopController();			
				
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
			
		}else if(uri.equals("/review/reviewShopManager.do")) {		
			command = new ReviewShopManagerController();			
			
		}else if(uri.equals("/review/test.do")) {		
			command = new TestController();		
		}
		
		
		
			
		
		
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);;
			return;
		}
		
		System.out.println("FS_uri : " + uri);
		page = command.execute(request);
		
		System.out.println("page :"+page);
		if(page.indexOf("json:")>=0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(page.substring(5));
		}else if(page.indexOf("redirect:")>=0){
			response.sendRedirect(page.substring(9));
		}else {
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		/*
		 * RequestDispatcher rd; rd = request.getRequestDispatcher(page);
		 * rd.forward(request, response);
		 */
	}
    
	
   
}
