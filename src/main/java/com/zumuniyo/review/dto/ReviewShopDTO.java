package com.zumuniyo.review.dto;

import java.sql.Date;

public class ReviewShopDTO {

	
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
	
	int	shop_seq;	
	String menu_category;	
	String menu_name;	
	int menu_price;	
	String menu_img;	
	int menu_top;	
	String menu_info;	
	String menu_status;
	

	public ReviewShopDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public ReviewShopDTO(int review_seq, int mem_seq, int menu_seq, float review_taste, float review_amount,
			float review_service, String review_content, String review_img, Date review_date, int review_exposure,
			int shop_seq, String menu_category, String menu_name, int menu_price, String menu_img, int menu_top,
			String menu_info, String menu_status) {
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
		this.shop_seq = shop_seq;
		this.menu_category = menu_category;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_img = menu_img;
		this.menu_top = menu_top;
		this.menu_info = menu_info;
		this.menu_status = menu_status;
	}




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
	
	
	public int getShop_seq() {
		return shop_seq;
	}
	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}
	public String getMenu_category() {
		return menu_category;
	}
	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	public int getMenu_top() {
		return menu_top;
	}
	public void setMenu_top(int menu_top) {
		this.menu_top = menu_top;
	}
	public String getMenu_info() {
		return menu_info;
	}
	public void setMenu_info(String menu_info) {
		this.menu_info = menu_info;
	}
	public String getMenu_status() {
		return menu_status;
	}
	public void setMenu_status(String menu_status) {
		this.menu_status = menu_status;
	}


	@Override
	public String toString() {
		return "ReviewShopDTO [review_seq=" + review_seq + ", mem_seq=" + mem_seq + ", menu_seq=" + menu_seq
				+ ", review_taste=" + review_taste + ", review_amount=" + review_amount + ", review_service="
				+ review_service + ", review_content=" + review_content + ", review_img=" + review_img
				+ ", review_date=" + review_date + ", review_exposure=" + review_exposure + ", shop_seq=" + shop_seq
				+ ", menu_category=" + menu_category + ", menu_name=" + menu_name + ", menu_price=" + menu_price
				+ ", menu_img=" + menu_img + ", menu_top=" + menu_top + ", menu_info=" + menu_info + ", menu_status="
				+ menu_status + "]";
	}


	
	
}
