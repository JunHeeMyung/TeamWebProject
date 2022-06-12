package com.zumuniyo.shop.controller;

import javax.servlet.http.HttpServletRequest;

//import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.model.ShopService;

public class ShopDetailController implements Command{

	@Override
	public String execute(HttpServletRequest request) {

		ShopService service = new ShopService();
		//ReviewService rservice = new ReviewService();
		
		request.setAttribute("shopdetail", service.selectBySeq(Integer.parseInt(request.getParameter("shop_seq"))));
		request.setAttribute("menulist", service.selectByMenu(Integer.parseInt(request.getParameter("shop_seq"))));
		//request.setAttribute("reviewShopList", rservice.selectByShopSeq(Integer.parseInt(request.getParameter("shop_seq"))));
		//request.setAttribute("shop_seq", request.getParameter("shop_seq"));
       // return "/view/shop/shopDetail.jsp";
		//System.out.println("왔느냐?");
        return "/review/reviewShop.do";
        ///review/reviewShop
	}

}
