package com.zumuniyo.orderlist.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.model.OrderlistService;

public class OrderlistUpdateController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		try {
			String status = request.getParameter("order_status");
			int group = Integer.parseInt(request.getParameter("order_group"));
	
			OrderlistService orderlistService = new OrderlistService();
			int result = orderlistService.updateStatusBygroup(status, group);
			if(result<=0) { 
				return "json:변경사항없음";
			}
		} catch(Exception e) {
			return "json:입력을 다시 확인해주세요";
		}
		
		return "json:성공";
	}

}
