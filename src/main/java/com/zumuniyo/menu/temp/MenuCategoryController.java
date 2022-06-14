package com.zumuniyo.menu.temp;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.menu.controller.Command;
import com.zumuniyo.menu.model.MenuService;

public class MenuCategoryController implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		MenuService mService = new MenuService();
		
		request.setAttribute("menuDatas", mService.selectByCategory(null, 3));
		
		return "/view/menu/menuListQR.jsp";
	}
		
	

}
