package com.zumuniyo.mypage.controller;

import javax.servlet.http.HttpServletRequest;

public class MypageEmty implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		System.out.println("로그인 안함");
		return "/view/index.jsp";
	}

}
