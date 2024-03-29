package com.zumuniyo.shop.dto;

public class ShopDTO {

	private int shop_seq;
	private String shop_name;
	private String loc_addr;
	private String shop_addr_detail;
	private int mem_seq;
	private String category_code;
	private String shop_img;
	private String shop_notice;
	private String shop_status;

	
	public ShopDTO() {}
	
	public ShopDTO(int shop_seq, String shop_name, String shop_img) {
		this.shop_seq = shop_seq;
		this.shop_name = shop_name;
		this.shop_img = shop_img;
	}


	public ShopDTO(int shop_seq, String shop_name, String loc_addr, String shop_addr_detail, int mem_seq,
			String category_code, String shop_img, String shop_notice, String shop_status) {

		this.shop_seq = shop_seq;
		this.shop_name = shop_name;
		this.loc_addr = loc_addr;
		this.shop_addr_detail = shop_addr_detail;
		this.mem_seq = mem_seq;
		this.category_code = category_code;
		this.shop_img = shop_img;
		this.shop_notice = shop_notice;
		this.shop_status = shop_status;
	}


	public int getShop_seq() {
		return shop_seq;
	}


	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}


	public String getShop_name() {
		return shop_name;
	}


	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}


	public String getLoc_addr() {
		return loc_addr;
	}


	public void setLoc_addr(String loc_addr) {
		this.loc_addr = loc_addr;
	}


	public String getShop_addr_detail() {
		return shop_addr_detail;
	}


	public void setShop_addr_detail(String shop_addr_detail) {
		this.shop_addr_detail = shop_addr_detail;
	}


	public int getMem_seq() {
		return mem_seq;
	}


	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}


	public String getCategory_code() {
		return category_code;
	}


	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}


	public String getShop_img() {
		return shop_img;
	}


	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}


	public String getShop_notice() {
		return shop_notice;
	}


	public void setShop_notice(String shop_notice) {
		this.shop_notice = shop_notice;
	}


	public String getShop_status() {
		return shop_status;
	}


	public void setShop_status(String shop_status) {
		this.shop_status = shop_status;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShopDTO [shop_seq=").append(shop_seq).append(", shop_name=").append(shop_name)
				.append(", loc_addr=").append(loc_addr).append(", shop_addr_detail=").append(shop_addr_detail)
				.append(", mem_seq=").append(mem_seq).append(", category_code=").append(category_code)
				.append(", shop_img=").append(shop_img).append(", shop_notice=").append(shop_notice)
				.append(", shop_status=").append(shop_status).append("]");
		return builder.toString();
	}
	
	
	
}
