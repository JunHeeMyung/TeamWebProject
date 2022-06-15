package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class TestController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		
		
        return "/view/review/reviewTest.jsp";		
		
	}

}
