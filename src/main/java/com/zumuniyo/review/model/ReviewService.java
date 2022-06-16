package com.zumuniyo.review.model;

import java.util.List;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.dto.ReviewShopDTO;

public class ReviewService {

	ReviewDAO reviewDAO = new ReviewDAO();
	
	
	public List<ReviewDTO> selectAll(){
		return reviewDAO.selectAll();
	}	
	public List<ReviewDTO> selectByMemSeq(int mem_seq){
		return reviewDAO.selectByMemSeq(mem_seq);
	}
	public List<ReviewShopDTO> selectByMenuSeq(int menu_seq){
		return reviewDAO.selectByMenuSeq(menu_seq);
	}	
	public List<ReviewShopDTO> selectByShopSeq(int shop_seq){
		return reviewDAO.selectByShopSeq(shop_seq);
	}	
	public List<ReviewShopDTO> selectByShopSeq_Manager(int shop_seq){
		return reviewDAO.selectByShopSeq_Manager(shop_seq);
	}
	
	public int reviewInsert(ReviewDTO reviewDTO) {
		return reviewDAO.reviewInsert(reviewDTO);
	}
	
	public int reviewInsert2(ReviewDTO reviewDTO) {
		return reviewDAO.reviewInsert2(reviewDTO);
	}	

	public int reviewUpdate(ReviewDTO reviewDTO) {
		return reviewDAO.reviewUpdate(reviewDTO);
	}
	
	
	public int reviewDelete(int rewview_seq) {
		return reviewDAO.reviewDelete(rewview_seq);
	}
		



	

}
