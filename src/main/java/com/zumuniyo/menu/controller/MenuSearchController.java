package com.zumuniyo.menu.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.menu.model.MenuService;

public class MenuSearchController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		MenuService mService = new MenuService();
		
		request.setAttribute("menuDatas", mService.selectByName(null, 3));
		
		return "/view/menu/menuListQR.jsp";
	}
		
	

}
