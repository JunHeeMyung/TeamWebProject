package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;


import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		//String method = request.getMethod();
		//String page = null;
		
		ReviewService service = new ReviewService();
		//if(method.equals("GET")) {
		request.setAttribute("reviewAllList", service.selectAll());
		return "/view/review/reviewAllList.jsp";
		
	
		
      //  selectByMemSeq 
        
		
		
		
        
	}
}
