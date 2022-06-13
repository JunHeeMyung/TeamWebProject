package com.zumuniyo.mypage.controller;

import javax.servlet.http.HttpServletRequest;


public class MypageADMIN implements Command{

	@Override
	public String execute(HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("관리자 접속");
		return "/view/mypage/mypageADMIN.jsp";
	}

}
