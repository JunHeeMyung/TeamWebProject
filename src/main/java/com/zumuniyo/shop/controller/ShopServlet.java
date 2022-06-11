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
		
		if(uri.equals("/shop/shopList")) {			
			command = new ShopListController();
		} else if(uri.equals("/shop/shopDetail")) {			
			command = new ShopDetailController();
		}
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}

		
		
		page = command.execute(request);
		
		RequestDispatcher rd;
		rd=request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

	

}
