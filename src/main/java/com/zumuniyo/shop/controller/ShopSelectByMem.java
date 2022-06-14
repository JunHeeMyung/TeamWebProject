package com.zumuniyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopSelectByMem implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		ShopService service = new ShopService();
		
		System.out.println(request.getParameter("mem_seq"));
		
		String mem_seq = request.getParameter("mem_seq");		
		List<ShopDTO> shopList = service.selectByMem(Integer.parseInt(mem_seq));
		
		
		
		return "/view/shop/shopListByMem.jsp";
	}

	
}
