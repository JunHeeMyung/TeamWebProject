package com.zumuniyo.review.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectMenuName implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		
		System.out.println("ReviewSelectMenuName");
		String menu_seq = request.getParameter("menu_seq");
		
		
		ReviewService service = new ReviewService();
		
		String menu_name = service.selectMenu(Integer.parseInt(menu_seq));
		
		
		return menu_name;
	}

}
