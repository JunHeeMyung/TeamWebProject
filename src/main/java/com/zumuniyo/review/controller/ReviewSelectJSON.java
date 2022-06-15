package com.zumuniyo.review.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;


public class ReviewSelectJSON implements Command {

	@Override
	public String execute(HttpServletRequest request) {			
			
			ReviewService service = new ReviewService();		
			
			List<ReviewDTO> reviewDTOs = service.selectAll();
			
			JSONArray jsonArray = new JSONArray();
			
			for(ReviewDTO reviewDTO:reviewDTOs) {
					
				JSONObject jsonObject = new JSONObject();
					
				jsonObject.put("review_seq", reviewDTO.getReview_seq());
				jsonObject.put("mem_seq", reviewDTO.getMem_seq());
				jsonObject.put("menu_seq", reviewDTO.getMenu_seq());
				jsonObject.put("review_taste", reviewDTO.getReview_taste());
				jsonObject.put("review_amount", reviewDTO.getReview_amount());
				jsonObject.put("review_service", reviewDTO.getReview_service());
				jsonObject.put("review_content", reviewDTO.getReview_content());
				jsonObject.put("review_img", reviewDTO.getReview_img());
				jsonObject.put("review_date", reviewDTO.getReview_date());
				jsonObject.put("review_exposure", reviewDTO.getReview_exposure());
				jsonArray.add(jsonObject);					
			}				
			request.setAttribute("reviewDTOs", jsonArray);
			return "json:"+jsonArray;	
		}
}


