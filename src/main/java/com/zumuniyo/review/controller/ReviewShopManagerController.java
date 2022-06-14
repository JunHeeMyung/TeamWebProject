package com.zumuniyo.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.dto.ReviewShopDTO;
import com.zumuniyo.review.model.ReviewService;

public class ReviewShopManagerController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		//매장관리자(사장님)의 추천리뷰 관리를 위한 list를 위한 컨트롤러
		
		//System.out.println("ReviewShopManagerController메소드"+request.getMethod());
		//int shop_seq =0;
		
		/*
		if(request.getParameter("shop_seq")==null) {
			request.setAttribute("message", "shop_seq을 입력이 하시오");
			return "/view/review/miss.jsp";
		}
		else
		{
			shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
			ReviewService service = new ReviewService();
			request.setAttribute("reviewShopManager", service.selectByShopSeq_Manager(shop_seq));
			return "/view/review/reviewShopManager.jsp";		
		}	
		 */
		System.out.println("ReviewShopManagerController");
		
		ReviewService service = new ReviewService();
		
		if(request.getParameter("shop_seq")==null) {
			return "json:매장 번호가 없습니다";
		}
		
		
		int shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
		
		List<ReviewShopDTO> reviewShopDTOs = service.selectByShopSeq_Manager(shop_seq);
		
		System.out.println("shop_seq :"+shop_seq);
		
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
