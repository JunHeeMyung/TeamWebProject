package com.zumuniyo.orderlist.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.dto.OrderlistDTO;
import com.zumuniyo.orderlist.model.OrderlistService;

public class OrderController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		String cart = request.getParameter("cart");
		System.out.println("주문요청:"+cart);

		if(cart==null||cart.equals("")) {
			return "json:카트가 비었습니다";
		}
		
		JSONParser parsor = new JSONParser();
		JSONArray jsonArray=null;
		try {
			jsonArray= (JSONArray) parsor.parse(cart);
		} catch (ParseException e) {
			return "json:카트에 문제가 있습니다";
		}
		
		List<OrderlistDTO> orderlistDTOs = new ArrayList<OrderlistDTO>();
		
		OrderlistService orderlistService = new OrderlistService();
		int nextOrderGroupSeq = orderlistService.selectNextOrderGroupSeq(); 
		
		
		for(int i=0;i<jsonArray.size();i++) {
			

			JSONObject jsonObject = (JSONObject)jsonArray.get(i);
			
			int menu_seq = Integer.parseInt(jsonObject.get("menu_seq").toString());
			int order_count = Integer.parseInt(jsonObject.get("order_count").toString());
			int order_tablenum = Integer.parseInt(jsonObject.get("order_tablenum").toString());
			int shop_seq = Integer.parseInt(jsonObject.get("shop_seq").toString()); //추가요망
			int mem_seq = -1;
			
			Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
	        if(loginInfo!=null) {
	        	mem_seq=Integer.parseInt(loginInfo.get("mem_seq"));
	        }

	        System.out.println(menu_seq);
	        System.out.println(order_count);
	        System.out.println(order_tablenum);
	        System.out.println(shop_seq);
	        System.out.println(mem_seq);
	        
	        
			//OrderlistDTO order = new OrderlistDTO(-1, nextOrderGroupSeq, shop_seq, menu_seq, order_count, order_tablenum, mem_seq, null, null);

			
		}
		
		int order_seq = nextOrderGroupSeq;
		return "json:주문성공:"+request.getContextPath()+"/orderlist/orderdetail.do?ordergroup="+order_seq;
	}

}
