package com.zumuniyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopListController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		ShopService service = new ShopService();
		
		List<ShopDTO> shoplist = service.selectShopAll();
		
		request.setAttribute("shoplist", shoplist);
		
		(request.getSession()).setAttribute("shoplist", shoplist);
		
		
		
        return "/view/shop/shopList.jsp";
	}
	

}
