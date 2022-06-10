package com.zumuniyo.review.model;

import java.util.List;
import com.zumuniyo.review.dto.ReviewDTO;

public class ReviewService {

	ReviewDAO reviewDAO = new ReviewDAO();
	
	
	public List<ReviewDTO> selectAll(){
		return reviewDAO.selectAll();
	}	
	public List<ReviewDTO> selectByMemSeq(int mem_seq){
		return reviewDAO.selectByMemSeq(mem_seq);
	}
	public List<ReviewDTO> selectByMenuSeq(int menu_seq){
		return reviewDAO.selectByMenuSeq(menu_seq);
	}	
	public List<ReviewDTO> selectByShopSeq(int shop_seq){
		return reviewDAO.selectByShopSeq(shop_seq);
	}
	
	public int reviewInsert(ReviewDTO reviewDTO) {
		return reviewDAO.reviewInsert(reviewDTO);
	}
	
	public int reviewUpdate_1(ReviewDTO reviewDTO) {
		return reviewDAO.reviewUpdate_1(reviewDTO);
	}
	public int reviewUpdate_0(ReviewDTO reviewDTO) {
		return reviewDAO.reviewUpdate_0(reviewDTO);
	}
	
	
	public int reviewDelete(ReviewDTO reviewDTO) {
		return reviewDAO.reviewDelete(reviewDTO);
	}
		



	

}
