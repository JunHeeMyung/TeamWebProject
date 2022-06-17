package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

//import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.model.ShopService;

public class ShopDetailController implements Command{

	@Override
	public String execute(HttpServletRequest request) {

        return "/view/shop/shopDetail.jsp";

	}

}
