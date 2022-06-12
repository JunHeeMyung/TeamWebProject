package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class TestController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
	//	ReviewService service = new ReviewService();
	//	service.selectByShopSeq(3);
		
		//request.setAttribute("reviewShoplists", service.selectByShopSeq(3));
        return "/view/review/reviewTest.jsp";		
		
	}

}
