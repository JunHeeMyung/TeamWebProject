package com.zumuniyo.review.dto;

import java.sql.Date;

public class ReviewDTO {
 	int review_seq;
	int mem_seq;
	int menu_seq;
	float review_taste;
	float review_amount;
	float review_service;
	String review_content;
	String review_img;
	Date review_date;
	int review_exposure;
	
	public ReviewDTO() {
		super();		
	}

	
	
	public ReviewDTO(int review_seq, int mem_seq, int menu_seq, float review_taste, float review_amount, float review_service,
			String review_content, String review_img, Date review_date, int review_exposure) {
		super();
		this.review_seq = review_seq;
		this.mem_seq = mem_seq;
		this.menu_seq = menu_seq;
		this.review_taste = review_taste;
		this.review_amount = review_amount;
		this.review_service = review_service;
		this.review_content = review_content;
		this.review_img = review_img;
		this.review_date = review_date;
		this.review_exposure = review_exposure;
	}

	
	
	

/*
	public int getReview_seq() {
		return review_seq;
	}

	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public float getReview_taste() {
		return review_taste;
	}

	public void setReview_taste(int review_taste) {
		this.review_taste = review_taste;
	}

	public float getReview_amount() {
		return review_amount;
	}

	public void setReview_amount(int review_amount) {
		this.review_amount = review_amount;
	}

	public float getReview_service() {
		return review_service;
	}

	public void setReview_service(int review_service) {
		this.review_service = review_service;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public int getReview_exposure() {
		return review_exposure;
	}

	public void setReview_exposure(int review_exposure) {
		this.review_exposure = review_exposure;
	}
*/
	
	
	public int getReview_seq() {
		return review_seq;
	}



	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}



	public int getMem_seq() {
		return mem_seq;
	}



	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}



	public int getMenu_seq() {
		return menu_seq;
	}



	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}



	public float getReview_taste() {
		return review_taste;
	}



	public void setReview_taste(float review_taste) {
		this.review_taste = review_taste;
	}



	public float getReview_amount() {
		return review_amount;
	}



	public void setReview_amount(float review_amount) {
		this.review_amount = review_amount;
	}



	public float getReview_service() {
		return review_service;
	}



	public void setReview_service(float review_service) {
		this.review_service = review_service;
	}



	public String getReview_content() {
		return review_content;
	}



	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}



	public String getReview_img() {
		return review_img;
	}



	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}



	public Date getReview_date() {
		return review_date;
	}



	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}



	public int getReview_exposure() {
		return review_exposure;
	}



	public void setReview_exposure(int review_exposure) {
		this.review_exposure = review_exposure;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ReviewDTO [review_seq=");
		builder.append(review_seq);
		builder.append(", mem_seq=");
		builder.append(mem_seq);
		builder.append(", menu_seq=");
		builder.append(menu_seq);
		builder.append(", review_taste=");
		builder.append(review_taste);
		builder.append(", review_amount=");
		builder.append(review_amount);
		builder.append(", review_service=");
		builder.append(review_service);
		builder.append(", review_content=");
		builder.append(review_content);
		builder.append(", review_img=");
		builder.append(review_img);
		builder.append(", review_date=");
		builder.append(review_date);
		builder.append(", review_exposure=");
		builder.append(review_exposure);
		builder.append("]");
		return builder.toString();
	}
	
	
	
	
	

}
