package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewMenuController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
ReviewService service = new ReviewService();
		
		request.setAttribute("reviewMenuList", service.selectByShopSeq(Integer.parseInt(request.getParameter("menu_seq"))));		
        return "/view/menu/menuDetail.jsp";
	}

}
