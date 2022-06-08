package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

public class ShopLocation implements Command {
	/*
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      double latitude = Double.parseDouble(request.getParameter("latitude"));
		double longitude = Double.parseDouble(request.getParameter("longitude"));
	      */
	@Override
	public String execute(HttpServletRequest request) {
		System.out.println(Double.parseDouble(request.getParameter("latitude")));
		System.out.println(Double.parseDouble(request.getParameter("longitude")));
		
		/*
		 * double latitude = Double.parseDouble(request.getParameter("latitude"));
		 * double longitude = Double.parseDouble(request.getParameter("longitude"));
		 */
		return "shopList.jsp";
	}
	
}
