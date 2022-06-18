package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectByShopController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
	
	    ReviewService service = new ReviewService();
	    String shop_seq = "";
	    
	    shop_seq = request.getParameter("shop_seq");
	    
	    if(request.getParameter("shop_seq")==null) {
	    	shop_seq = "4";
	    	//return "json: shop_seq가 없습니다. ";
	    }

		request.setAttribute("reviewShopManager", service.selectByShopSeq(Integer.parseInt(shop_seq)));	
		
		return "/view/review/reviewShopManager.jsp";
	}
}
