package com.zumuniyo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectShopReviewJSP implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		System.out.println("ReviewSelectShopReview");
		
		
		HttpSession session = request.getSession();
		System.out.println("세션 생성 여부"+session.isNew());		
	
		
	    JSONObject jObject = new JSONObject();
	    jObject =   (JSONObject) session.getAttribute("member");
	    String mem_seq = (String) jObject.get("mem_seq");
		
		System.out.println("mem_seq :"+mem_seq);	
		
		
				
		ReviewService service = new ReviewService();		
				
		List<ReviewDTO> reviewDTOs = new ArrayList<>();		
		reviewDTOs = service.selectShopReview(Integer.parseInt(mem_seq));
		
		System.out.println(reviewDTOs);
		
		request.setAttribute("reviewDTOs", reviewDTOs);
		
		return "/view/review/reviewShopMtest.jsp";
	}

}
