package com.zumuniyo.shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/shop/*")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(uri);
		
		String page = "";
		Command command = null;
		
		if(uri.equals("/shop/shopList.do")) {			
			command = new ShopListController();
		} else if(uri.equals("/shop/shopDetail.do")) {			
			command = new ShopDetailController();
		}  else if(uri.equals("/shop/shopInsert.do")) {			
			command = new ShopInsertController();
		} else if(uri.equals("/shop/shopUpdate.do")) {			
			command = new ShopUpdateController();
		}
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}

		
		
		page = command.execute(request);
		
		if(page.indexOf("json:")>=0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(page.substring(5));
		}else if(page.indexOf("redirect:")>=0){
			response.sendRedirect(page.substring(9));
		}else {
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	

}
