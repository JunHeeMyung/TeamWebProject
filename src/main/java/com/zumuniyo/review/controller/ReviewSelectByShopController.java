package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectByShopController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		
		ReviewService service = new ReviewService();
		
		System.out.println(request.getAttribute("mem_seq"));
		
				
		//request.setAttribute("reviewShopList", service.selectByShopSeq(Integer.parseInt(request.getParameter("shop_seq"))));
		
		
		return null;
	}

}
