package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;


public class ReviewSelectController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
				
		ReviewService service = new ReviewService();
		request.setAttribute("reviewAllList", service.selectAll());
        return "/view/review/reviewAllList.jsp";
	}
}
