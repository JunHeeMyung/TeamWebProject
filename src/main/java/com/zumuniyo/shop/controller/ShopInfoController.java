package com.zumuniyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopInfoController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ShopService shopService = new ShopService();
		ShopDTO shopDTO = (shopService.selectBySeq(Integer.parseInt(request.getParameter("shop_seq")))).get(0);
		
		return "json:"+ shopDTO.getShop_notice();
	}

}
