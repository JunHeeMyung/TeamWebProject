package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.shop.model.ShopService;

public class ShopDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		if(request.getParameter("shop_seq")==null||request.getParameter("shop_seq").equals("")) {
			return "json:입력이 없습니다";
		}
		
		ShopService service = new ShopService();
		
		int shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
		
		if( service.delete(shop_seq)<=0) {
			return "json:변경 사항이 없습니다";
		}
		
		return "redirect:"+request.getContextPath()+"/shop/shopselectByMem.do";
	}

}
