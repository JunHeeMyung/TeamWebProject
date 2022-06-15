package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewDelete implements Command {

	@Override
	public String execute(HttpServletRequest request) {		
	
		int review_seq;			
		
		if(request.getParameter("review_seq")==null) {
			request.setAttribute("message", "review_seq을 입력이 하시오");
			return "json: review_seq이 존재하지 않습니다.";
			
		}else {
			
			review_seq = Integer.parseInt(request.getParameter("review_seq"));
			ReviewService service = new ReviewService();
			int result = service.reviewDelete(review_seq);
			request.setAttribute("message", result>0?"삭제성공":"삭제실패");
		
			if(result<=0) {			
				return "json:삭제 실패";
			}else {
				return "json:삭제 성공";			
			}		
		}
	}
}