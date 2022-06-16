package com.zumuniyo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.dto.ReviewShopDTO;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectMemJSON implements Command {

	@Override
	public String execute(HttpServletRequest request) {		
		
		if(request.getParameter("mem_seq")==null) {
			return "json:멤버 번호가 없습니다";
		}				
		
		ReviewService service = new ReviewService();	
		
		String mem_seq = request.getParameter("mem_seq");
		
		List<ReviewDTO> reviewDTOs = new ArrayList<>();		
		reviewDTOs = service.selectByMemSeq(Integer.parseInt(mem_seq));
		
		
		System.out.println("reviewDTOs"+reviewDTOs);
		JSONArray jsonArray = new JSONArray();		
		for(ReviewDTO reviewShopDTO:reviewDTOs) {			
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("mem_seq", reviewShopDTO.getMem_seq()+"");
			jsonObject.put("menu_seq", reviewShopDTO.getMenu_seq()+"");
			
			jsonObject.put("review_taste", reviewShopDTO.getReview_taste()+"");
			jsonObject.put("review_amount", reviewShopDTO.getReview_amount()+"");
			jsonObject.put("review_service", reviewShopDTO.getReview_service()+"");			
			jsonObject.put("review_img", reviewShopDTO.getReview_img()+"");
			jsonObject.put("review_date", reviewShopDTO.getReview_date()+"");		
			jsonObject.put("review_content", reviewShopDTO.getReview_content()+"");				
			jsonObject.put("review_exposure", reviewShopDTO.getReview_exposure()+"");
			jsonArray.add(jsonObject);		
			}
		return "json:"+jsonArray;
	}

}
