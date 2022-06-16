package com.zumuniyo.administrator.controller;

import javax.servlet.http.HttpServletRequest;

public class AdminStatistics implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		System.out.println("adminStatistics 컨트롤러 들어옮");
		// TODO Auto-generated method stub
		return "/view/admin/adminStatistics.jsp";
	}

}
