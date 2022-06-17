package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.model.ShopService;

public class ShopDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		ShopService service = new ShopService();
		
		int shop_seq =21;
		//shop_seq = (int) request.getAttribute("shop_seq");
		
		
		
		int result = service.delete(shop_seq);
		
		
		
		return "/view/shop/testIndex.jsp";
	}

}
