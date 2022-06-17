package com.zumuniyo.orderlist.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.model.OrderlistService;

public class MyOrderListController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null) {
        	return "redirect:"+request.getContextPath()+"/member/login.do";
        }
        
        OrderlistService orderlistService = new OrderlistService();
        
        int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));
        
        JSONArray orderlist = orderlistService.selectByMemSeqWithMenuAndShop(mem_seq);

        request.setAttribute("orderlist", orderlist);
        
		return "/view/orderlist/myorderlist.jsp";
		
	}

}
