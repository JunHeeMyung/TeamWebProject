package com.zumuniyo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ReviewSelectByShopController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		
		/*
		 * HttpSession session = request.getSession(); JSONObject jObject = new
		 * JSONObject(); jObject = (JSONObject) session.getAttribute("member"); String
		 * mem_seq = (String) jObject.get("mem_seq");
		 */		
	    ReviewService service = new ReviewService();
	    String shop_seq = "";
	    if(request.getParameter("shop_seq")==null) {
	    	shop_seq = "4";
	    } else {
	    	shop_seq = request.getParameter("shop_seq");	    	
	    }
	    
	    	
	    

		request.setAttribute("reviewShopManager", service.selectByShopSeq(Integer.parseInt(shop_seq)));
	  //request.setAttribute("reviewShopManager", service.selectByShopSeq(Integer.parseInt(mem_seq)));
	
		
		return "/view/review/reviewShopManager.jsp";
	}

}
