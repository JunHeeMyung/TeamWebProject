package com.zumuniyo.orderlist.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;

import com.zumuniyo.common.Command;
import com.zumuniyo.orderlist.model.OrderlistDAO;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class ShopOrderlistController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		/*
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null) {
        	return "json:로그인 정보가 없습니다.";
        }        
        */
        int shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
        /*
         * int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));
        ShopService shopService = new ShopService();
        List<ShopDTO> shoplist = shopService.selectBySeq(shop_seq);
        
        if(shoplist.get(0).getMem_seq()!=mem_seq) {
        	return "json:매장주인이 아닙니다";
        }
         */
        OrderlistDAO orderlistDAO = new OrderlistDAO();
        
        JSONArray jsonArray = orderlistDAO.selectByShopSeqWithMenuAndShop(shop_seq);
        
        request.setAttribute("orderlist", jsonArray);
        
		return "/view/orderlist/shoporderlist.jsp";

	}

}
