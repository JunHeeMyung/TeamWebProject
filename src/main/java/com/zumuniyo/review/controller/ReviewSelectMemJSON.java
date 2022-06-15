package com.zumuniyo.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.review.dto.ReviewShopDTO;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectMemJSON implements Command {

	@Override
	public String execute(HttpServletRequest request) {		
		
		if(request.getParameter("mem_seq")==null) {
			return "json:매뉴 번호가 없습니다";
		}				
		
		ReviewService service = new ReviewService();	
		
		String mem_seq = request.getParameter("mem_seq");
		service.selectByMemSeq(Integer.parseInt(mem_seq));
		
		List<ReviewShopDTO> reviewShopDTOs = new ArrayList<ReviewShopDTO>();		
		
		JSONArray jsonArray = new JSONArray();		
		for(ReviewShopDTO reviewShopDTO:reviewShopDTOs) {			
			JSONObject jsonObject = new JSONObject();
			
			jsonObject.put("mem_seq", reviewShopDTO.getMem_seq()+"");
			jsonObject.put("menu_seq", reviewShopDTO.getMenu_seq()+"");
			jsonObject.put("shop_seq", reviewShopDTO.getShop_seq()+"");
			jsonObject.put("review_taste", reviewShopDTO.getReview_taste()+"");
			jsonObject.put("review_amount", reviewShopDTO.getReview_amount()+"");
			jsonObject.put("review_service", reviewShopDTO.getReview_service()+"");
			jsonObject.put("menu_img", reviewShopDTO.getMenu_img()+"");
			jsonObject.put("review_img", reviewShopDTO.getReview_img()+"");
			jsonObject.put("review_date", reviewShopDTO.getReview_date()+"");		
			jsonObject.put("review_content", reviewShopDTO.getReview_content()+"");				
			jsonObject.put("review_exposure", reviewShopDTO.getReview_exposure()+"");
			jsonObject.put("menu_category", reviewShopDTO.getMenu_category()+"");
			jsonObject.put("menu_name", reviewShopDTO.getMenu_name()+"");
			jsonObject.put("menu_price", reviewShopDTO.getMenu_price()+"");
			jsonObject.put("menu_top", reviewShopDTO.getMenu_top()+"");
			jsonObject.put("menu_info", reviewShopDTO.getMenu_info()+"");
			jsonObject.put("menu_status", reviewShopDTO.getMenu_status()+"");			
			jsonArray.add(jsonObject);		
			}
		return "json:"+jsonArray;
	}

}
