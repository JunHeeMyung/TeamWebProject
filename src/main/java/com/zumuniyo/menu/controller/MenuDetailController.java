package com.zumuniyo.menu.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;

public class MenuDetailController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		
		if(request.getMethod().equals("GET")) {
		
			MenuService mService = new MenuService();
		
			if(request.getParameter("menu_seq")==null) {
				return "json:메뉴 시퀀스가 존재하지 않습니다";
			}
			
			String menu_seq = request.getParameter("menu_seq");
			
			char[] array = menu_seq.toCharArray();
			for(char c : array) {
				if(!Character.isDigit(c)) return "json:메뉴시퀀스 입력값이 숫자가 아닙니다";
			}
			
			int imenu_seq = Integer.parseInt(menu_seq);
			
			MenuDTO menuDTO = mService.selectByMenuId(imenu_seq);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("menu_seq", menuDTO.getMenu_seq());
			jsonObject.put("menu_category", menuDTO.getMenu_category());
			jsonObject.put("shop_seq", menuDTO.getShop_seq());
			jsonObject.put("menu_name", menuDTO.getMenu_name());
			jsonObject.put("menu_price", menuDTO.getMenu_price());
			jsonObject.put("menu_img", menuDTO.getMenu_img());
			jsonObject.put("menu_top", menuDTO.getMenu_top());
			jsonObject.put("menu_info", menuDTO.getMenu_info());
			jsonObject.put("menu_status", menuDTO.getMenu_status());
			
			
			
			
			request.setAttribute("menuDTO", jsonObject);
			
			//return "json:"+jsonObject.toJSONString();
			return "/view/menu/menuListFrontDesign.jsp";
	
		} else {
			
			MenuService mService = new MenuService();
			
			if(request.getParameter("menu_seq")==null) {
				return "json:메뉴 시퀀스가 존재하지 않습니다";
			}
			
			String menu_seq = request.getParameter("menu_seq");
			
			char[] array = menu_seq.toCharArray();
			for(char c : array) {
				if(!Character.isDigit(c)) return "json:메뉴시퀀스 입력값이 숫자가 아닙니다";
			}
			
			int imenu_seq = Integer.parseInt(menu_seq);
			
			MenuDTO menuDTO = mService.selectByMenuId(imenu_seq);
			
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("menu_seq", menuDTO.getMenu_seq());
			jsonObject.put("menu_category", menuDTO.getMenu_category());
			jsonObject.put("shop_seq", menuDTO.getShop_seq());
			jsonObject.put("menu_name", menuDTO.getMenu_name());
			jsonObject.put("menu_price", menuDTO.getMenu_price());
			jsonObject.put("menu_img", menuDTO.getMenu_img());
			jsonObject.put("menu_top", menuDTO.getMenu_top());
			jsonObject.put("menu_info", menuDTO.getMenu_info());
			jsonObject.put("menu_status", menuDTO.getMenu_status());
			
			
		
			return "json:"+jsonObject.toJSONString();
			
			
		}
	
	}

}
