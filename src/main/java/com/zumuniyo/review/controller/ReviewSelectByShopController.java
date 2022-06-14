package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.model.ShopService;

public class ReviewSelectByShopController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
	    JSONObject jObject = new JSONObject();
	    jObject =   (JSONObject) session.getAttribute("member");
	    String mem_seq = (String) jObject.get("mem_seq");
		
	
		
		ReviewService service = new ReviewService();
		ShopService sService = new ShopService();
		
		
		
		
		System.out.println(mem_seq);		
				
//		request.setAttribute("reviewShopList", service.selectByShopSeq(Integer.parseInt(request.getParameter("shop_seq"))));
		request.setAttribute("reviewShopManager", service.selectByShopSeq(Integer.parseInt(mem_seq)));
	
		
		return "/view/review/reviewShopManager.jsp";
	}

}
