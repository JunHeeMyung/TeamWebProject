package com.zumuniyo.mypage.controller;

import javax.servlet.http.HttpServletRequest;


public class MYpageNOMAL implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		System.out.println("일반회원 접속");
		return "/view/mypage/mypageNOMAL.jsp";
	}

}
