package com.zumuniyo.administrator.controller;

import javax.servlet.http.HttpServletRequest;

public class AdminShopController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		return "/view/admin/adminShop.jsp";
	}

}
