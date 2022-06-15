package com.zumuniyo.review.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.util.UploadUtil;

public class ReviewInsert implements Command {
	private static final String UPLOAD_DIR = "images";
	
	@Override
	public String execute(HttpServletRequest request) {
		
	
		if((request.getParameter("mem_seq")==null)||(request.getParameter("menu_seq")==null)) {
			return "json:리뷰등록실패";			
		}else {
	
					
		//	int mem_seq = Integer.parseInt(request.getParameter("mem_seq"));			
		//	int menu_seq = Integer.parseInt(request.getParameter("menu_seq"));		
		//	String method = request.getMethod(); String page = null;
	

			String dir = request.getServletContext().getRealPath(UPLOAD_DIR);
			System.out.println("업로드 폴더: " + dir);

			Map<String, Object> map = UploadUtil.uploadFile(UPLOAD_DIR, request);
			List<String> photos = (List<String>) map.get("photos");
			System.out.println("업로드 사진: " + photos);

			// 이후 파라메터 DB 입력
			Map<String, String> params = (Map<String, String>) map.get("params");
			for (String key : params.keySet()) {
				System.out.println(key + ":" + params.get(key));
			}

			ReviewDTO reviewDTO = makeReview(request);
			reviewDTO.setReview_img(photos.get(0));
			ReviewService service = new ReviewService();
			int result = service.reviewInsert2(reviewDTO);
			//request.setAttribute("message", result > 0 ? "리뷰등록성공" : "리뷰등록실패");						
					
			if(result<=0) {			
				return "json:리뷰등록실패";
			}else {
				return "json:리뷰등록성공";			
			}	
		}
	}

	private ReviewDTO makeReview(HttpServletRequest request) {
		ReviewDTO reviewDTO = new ReviewDTO();

		System.out.println("review_taste :" + request.getParameter("review_taste"));
		System.out.println("review_amount :" + request.getParameter("review_amount"));
		System.out.println("review_service :" + request.getParameter("review_service"));
		System.out.println("review_content :" + request.getParameter("review_content"));

		// int review_seq = readInt(request, "review_seq");
		int mem_seq = readInt(request, "mem_seq");
		int menu_seq = readInt(request, "menu_seq");
		float review_taste = readFloat(request, "review_taste");
		float review_amount = readFloat(request, "review_amount");
		float review_service = readFloat(request, "review_service");
		String review_content = request.getParameter("review_content");
		//String review_img = request.getParameter("review_img");
		// Date review_date = readDate(request, "review_date");
		// int review_exposure = readInt(request, "review_exposure");

		// reviewDTO.setReview_seq(review_seq);
		reviewDTO.setMem_seq(mem_seq);
		reviewDTO.setMenu_seq(menu_seq);
		reviewDTO.setReview_taste(review_taste);
		reviewDTO.setReview_amount(review_amount);
		reviewDTO.setReview_service(review_service);
		reviewDTO.setReview_content(review_content);
		// reviewDTO.setReview_img(review_img);
		// reviewDTO.setReview_date(review_date);
		// reviewDTO.setReview_exposure(review_exposure);
		return reviewDTO;
	}

	private float readFloat(HttpServletRequest request, String column) {
		String data = request.getParameter(column);
		return Float.parseFloat(data);
	}
	
	private int readInt(HttpServletRequest request, String column) { 
		String data = request.getParameter(column);
		return Integer.parseInt(data);	 
	 }
	/*
	 * private Double readDouble(HttpServletRequest request, String column) { String
	 * data = request.getParameter(column); return Double.parseDouble(data); }
	 * 
	 * private Date readDate(HttpServletRequest request, String column) { String
	 * data = request.getParameter(column); return DateUtil.convertToDate(data); }

	 */
}
