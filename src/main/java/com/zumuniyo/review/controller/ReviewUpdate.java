package com.zumuniyo.review.controller;


import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;


public class ReviewUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		if((request.getParameter("review_seq")==null)||(request.getParameter("review_exposure")==null)) {
			return "json:review_seq 또는 review_exposure 값이 누락됨";			
		}else {			
			ReviewDTO reviewDTO = makeReview(request);			
			ReviewService service = new ReviewService();			
			
			int result = service.reviewUpdate(reviewDTO);						
					
			if(result<=0) {			
				return "json:추천리뷰 등록실패";
			}else {
				return "json:추천리뷰 등록성공";			
			}	
		}
	}

	private ReviewDTO makeReview(HttpServletRequest request) {
		ReviewDTO reviewDTO = new ReviewDTO();

		System.out.println("review_seq :" + request.getParameter("review_seq"));
		System.out.println("review_exposure :" + request.getParameter("review_exposure"));

		int review_seq = readInt(request, "review_seq");
		int review_exposure = readInt(request, "review_exposure");
		
		reviewDTO.setReview_seq(review_seq);
		reviewDTO.setReview_exposure(review_exposure);
		
		return reviewDTO;
	}

	private int readInt(HttpServletRequest request, String column) { 
		String data = request.getParameter(column);
		return Integer.parseInt(data);	 
	 }	
}