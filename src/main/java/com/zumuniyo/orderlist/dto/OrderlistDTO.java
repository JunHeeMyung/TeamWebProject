package com.zumuniyo.orderlist.dto;

import java.sql.Date;

public class OrderlistDTO {
	
	private int order_seq;
	private int order_group;
	private int shop_seq;
	private int menu_seq;
	private int order_count;
	private int order_tablenum;
	private int mem_seq;
	private Date order_date;
	private String order_status;

	public OrderlistDTO() {}

	public OrderlistDTO(int order_seq, int order_group, int shop_seq, int menu_seq, int order_count, int order_tablenum,
			int mem_seq, Date order_date, String order_status) {
		
		this.order_seq = order_seq;
		this.order_group = order_group;
		this.shop_seq = shop_seq;
		this.menu_seq = menu_seq;
		this.order_count = order_count;
		this.order_tablenum = order_tablenum;
		this.mem_seq = mem_seq;
		this.order_date = order_date;
		this.order_status = order_status;
	}

	public int getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(int order_seq) {
		this.order_seq = order_seq;
	}

	public int getOrder_group() {
		return order_group;
	}

	public void setOrder_group(int order_group) {
		this.order_group = order_group;
	}

	public int getShop_seq() {
		return shop_seq;
	}

	public void setShop_seq(int shop_seq) {
		this.shop_seq = shop_seq;
	}

	public int getMenu_seq() {
		return menu_seq;
	}

	public void setMenu_seq(int menu_seq) {
		this.menu_seq = menu_seq;
	}

	public int getOrder_count() {
		return order_count;
	}

	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}

	public int getOrder_tablenum() {
		return order_tablenum;
	}

	public void setOrder_tablenum(int order_tablenum) {
		this.order_tablenum = order_tablenum;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderlistDTO [order_seq=").append(order_seq).append(", order_group=").append(order_group)
				.append(", shop_seq=").append(shop_seq).append(", menu_seq=").append(menu_seq).append(", order_count=")
				.append(order_count).append(", order_tablenum=").append(order_tablenum).append(", mem_seq=")
				.append(mem_seq).append(", order_date=").append(order_date).append(", order_status=")
				.append(order_status).append("]");
		return builder.toString();
	}
	

}
