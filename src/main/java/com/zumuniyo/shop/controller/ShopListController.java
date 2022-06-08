package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.model.ShopService;

public class ShopListController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		ShopService service = new ShopService();
		request.setAttribute("shoplist", service.selectShopAll());
        return "/view/shop/shopList.jsp";
	}
	

}
