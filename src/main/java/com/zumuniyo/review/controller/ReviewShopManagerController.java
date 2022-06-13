package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewShopManagerController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		//매장관리자(사장님)의 추천리뷰 관리를 위한 list를 위한 컨트롤러
		
		//System.out.println("ReviewShopManagerController메소드"+request.getMethod());
		int shop_seq =0;
		
		
		if(request.getParameter("shop_seq")==null) {
			request.setAttribute("message", "shop_seq을 입력이 하시오");
			return "/view/review/miss.jsp";
		}
		else
		{
			shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
			ReviewService service = new ReviewService();
			request.setAttribute("reviewShopManager", service.selectByShopSeq_Manager(shop_seq));
			return "/view/review/reviewShopManager.jsp";		
		}		
	}
}
