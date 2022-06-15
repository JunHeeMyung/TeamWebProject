package com.zumuniyo.orderlist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.dto.OrderlistDTO;

public class OrderController implements Command {

	@Override
	public String execute(HttpServletRequest request) {

		String cart = request.getParameter("cart");
		System.out.println(cart);

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
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObject = (JSONObject)jsonArray.get(i);
			//OrderlistDTO order = new OrderlistDTO(i, i, i, i, i, i, i, null, cart);
			
			
			//String name = (String)jsonObject.get("이름");
			//int age = Integer.parseInt(jsonObject.get("나이").toString());
			
		}
		
		
		
		
		int order_seq = 1;
		
		
		
		
		return "json:주문성공:"+request.getContextPath()+"/orderlist/orderdetail.do?order_seq="+order_seq;
	}

}
