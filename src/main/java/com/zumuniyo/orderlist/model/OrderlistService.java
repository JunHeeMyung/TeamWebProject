package com.zumuniyo.orderlist.model;

import java.util.List;

import org.json.simple.JSONArray;

import com.zumuniyo.orderlist.dto.OrderlistDTO;


public class OrderlistService {
	
	OrderlistDAO orderlistDAO = new OrderlistDAO();
	
	
	public List<OrderlistDTO> selectAll() {
		return orderlistDAO.selectAll();
	}
	
	public int selectNextOrderGroupSeq() {
		return orderlistDAO.selectNextOrderGroupSeq();
	}

	public int insertOrder(OrderlistDTO order) {
		return orderlistDAO.insertOrder(order);
	}

	public List<OrderlistDTO> selectByMemSeq(int mem_seq) {
		return orderlistDAO.selectByMemSeq(mem_seq);
	}
	
	public List<OrderlistDTO> selectByShopSeq(int shop_seq) {
		return orderlistDAO.selectByShopSeq(shop_seq);
	}
	
	public List<OrderlistDTO> selectByOrderGroupSeq(int order_group_seq) {
		return orderlistDAO.selectByOrderGroupSeq(order_group_seq);
	}
	
	public JSONArray selectByOrderGroupSeqWithMenuAndShop(int order_group_seq) {
		return orderlistDAO.selectByOrderGroupSeqWithMenuAndShop(order_group_seq);
	}
	
	public JSONArray selectByMemSeqWithMenuAndShop(int mem_seq) {
		return orderlistDAO.selectByMemSeqWithMenuAndShop(mem_seq);
	}


}
