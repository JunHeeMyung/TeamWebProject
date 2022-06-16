package com.zumuniyo.review.dto;

public class ReviewMenuDTO {

	int menu_seq;	
	String menu_category;	
	int shop_seq;
	String menu_name;	
	int menu_price;
	String menu_img;
	int menu_top;
	String menu_info;	
	String menu_status;
	
	
	
	public ReviewMenuDTO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public ReviewMenuDTO(int menu_seq, String menu_category, int shop_seq, String menu_name, int menu_price,
			String menu_img, int menu_top, String menu_info, String menu_status) {
		super();
		this.menu_seq = menu_seq;
		this.menu_category = menu_category;
		this.shop_seq = shop_seq;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_img = menu_img;
		this.menu_top = menu_top;
		this.menu_info = menu_info;
		this.menu_status = menu_status;
	}



	public int getMenu_seq() {
		return menu_seq;
	}



	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}



	public String getMenu_category() {
		return menu_category;
	}



	public void setMenu_category(String menu_category) {
		this.menu_category = menu_category;
	}



	public int getShop_seq() {
		return shop_seq;
	}



	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
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
		return "ReviewMemDTO [menu_seq=" + menu_seq + ", menu_category=" + menu_category + ", shop_seq=" + shop_seq
				+ ", menu_name=" + menu_name + ", menu_price=" + menu_price + ", menu_img=" + menu_img + ", menu_top="
				+ menu_top + ", menu_info=" + menu_info + ", menu_status=" + menu_status + "]";
	}
	
	
	
	
	
	
	
	
}
