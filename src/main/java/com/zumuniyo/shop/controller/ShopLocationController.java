package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.model.ShopService;

public class ShopLocationController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		ShopService service = new ShopService();
        request.setAttribute("shoplocation", service.selectByLocation(0, 0));
        return "shopList.jsp";
	}
	
	
	
}
