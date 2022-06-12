package com.zumuniyo.mypage.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.controller.Command;
//import com.zumuniyo.review.model.ReviewService;

public class MypageFirstController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		//ReviewService service = new ReviewService();
		//request.setAttribute("reviewAllList", service.selectAll());
        return "/view/mypage/mypageFirst.jsp";
	}

}
