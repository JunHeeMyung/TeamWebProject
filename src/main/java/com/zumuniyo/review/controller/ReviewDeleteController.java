package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewDeleteController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
//		int review_seq = 61;
	
		int review_seq = 0;			
		
		
		if(request.getParameter("review_seq")==null) {
			request.setAttribute("message", "review_seq을 입력이 하시오");
			return "/view/review/miss.jsp";
		}else {
			
		review_seq = Integer.parseInt(request.getParameter("review_seq"));
		ReviewService service = new ReviewService();
		int result = service.reviewDelete(review_seq);
		request.setAttribute("message", result>0?"삭제성공":"삭제실패");
		
		return "/review/revieMemList.do";
		}
	}

}
