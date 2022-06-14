package com.zumuniyo.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopSelectByMem implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		System.out.println("세션 생성 여부"+session.isNew());
			
		
		if(session.getAttribute("member")==null) {
			System.out.println("세션 맴버변수 못 받음");	
		}
		
	    JSONObject jObject = new JSONObject();
	    jObject =   (JSONObject) session.getAttribute("member");
	    String mem_seq = (String) jObject.get("mem_seq");
	    
		
		
		
		
		ShopService service = new ShopService();
		
		
		
		System.out.println("mem_seq "+mem_seq);
		
				
		List<ShopDTO> shopList = service.selectByMem(Integer.parseInt(mem_seq));
		
		request.setAttribute("shopLists", shopList);
		
		return "/view/shop/shopListByMem.jsp";
	}

	
}
