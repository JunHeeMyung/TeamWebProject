package com.zumuniyo.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopListController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		ShopService service = new ShopService();		
		List<ShopDTO> shoplist = service.selectShopAll();		
		
		if(request.getMethod().equals("GET")){
			
			
			request.setAttribute("shoplist", shoplist);
			 return "/view/shop/shopList.jsp";
		}else {
			System.out.println("post");
			HttpSession session = request.getSession();
			session.setAttribute("shopDTOs",shoplist);
			return null;
		}
		
	
		//(request.getSession()).setAttribute("shoplist", shoplist);		
		
		
		
		
		
		
       
	}
	

}
