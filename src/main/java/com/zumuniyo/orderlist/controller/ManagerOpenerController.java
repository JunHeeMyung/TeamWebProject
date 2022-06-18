package com.zumuniyo.orderlist.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.model.OrderlistService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ManagerOpenerController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null) {
        	return "redirect:"+request.getContextPath()+"/member/login.do";
        }
        
        OrderlistService orderlistService = new OrderlistService();
        
        int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));
        
        ShopService shopService = new ShopService();
        List<ShopDTO> shoplist = shopService.selectByMem(mem_seq);
		
		request.setAttribute("shoplist", shoplist);
		
		System.out.println(mem_seq+" 샵조회");
		
		return "/view/orderlist/manageropener.jsp";
	}

}
