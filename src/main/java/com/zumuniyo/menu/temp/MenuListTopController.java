package com.zumuniyo.menu.temp;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.menu.controller.Command;
import com.zumuniyo.menu.model.MenuService;

public class MenuListTopController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		MenuService mService = new MenuService();
		
		request.setAttribute("menuDatas", mService.selectByHitMenu(3));
		
		return "/view/menu/menuListQR.jsp";
	}
		
	

}
