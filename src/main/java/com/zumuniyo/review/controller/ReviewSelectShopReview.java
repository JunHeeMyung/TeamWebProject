package com.zumuniyo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.mypage.controller.MypageEmty;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectShopReview implements Command {

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
		
		JSONArray jsonArray = new JSONArray();		
		for(ReviewDTO reviewDTO:reviewDTOs) {			
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("mem_seq", reviewDTO.getMem_seq()+"");
			jsonObject.put("menu_seq", reviewDTO.getMenu_seq()+"");			
			jsonObject.put("review_taste", reviewDTO.getReview_taste()+"");
			jsonObject.put("review_amount", reviewDTO.getReview_amount()+"");
			jsonObject.put("review_service", reviewDTO.getReview_service()+"");			
			jsonObject.put("review_img", reviewDTO.getReview_img()+"");
			jsonObject.put("review_date", reviewDTO.getReview_date()+"");		
			jsonObject.put("review_content", reviewDTO.getReview_content()+"");				
			jsonObject.put("review_exposure", reviewDTO.getReview_exposure()+"");
			
			jsonArray.add(jsonObject);		
			}
		
		return "json:"+jsonArray;
	}

}
