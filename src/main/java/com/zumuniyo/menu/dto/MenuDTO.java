package com.zumuniyo.menu.dto;

public class MenuDTO {

	private int menu_seq;
	private String menu_category;
	private int shop_seq;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private int menu_top;
	private String menu_info;
	private String menu_status;
	
	
	public MenuDTO() {
		
		super();
	}
	
	
	public MenuDTO(int menu_seq, String menu_category, int shop_seq, String menu_name, int menu_price, String menu_img,
			int menu_top, String menu_info, String menu_status) {
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
		StringBuilder builder = new StringBuilder();
		builder.append("MenuDAO [menu_seq=").append(menu_seq).append(", menu_category=").append(menu_category)
				.append(", shop_seq=").append(shop_seq).append(", menu_name=").append(menu_name).append(", menu_price=")
				.append(menu_price).append(", menu_img=").append(menu_img).append(", menu_top=").append(menu_top)
				.append(", menu_info=").append(menu_info).append(", menu_status=").append(menu_status).append("]");
		return builder.toString();
	}
	
	
	
	
	
	
}
