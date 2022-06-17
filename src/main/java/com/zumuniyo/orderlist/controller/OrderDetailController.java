package com.zumuniyo.orderlist.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.model.OrderlistService;

public class OrderDetailController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		int ordergroup = Integer.parseInt(request.getParameter("ordergroup"));
		
		OrderlistService orderlistService = new OrderlistService();
		
		JSONArray orderlist = orderlistService.selectByOrderGroupSeqWithMenuAndShop(ordergroup);
		
		request.setAttribute("orderlist", orderlist);
		
		return "/view/orderlist/orderdetail.jsp";
	}

}
