package com.zumuniyo.mypage.controller;

import javax.servlet.http.HttpServletRequest;


public class MypageBUSINESS implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		System.out.println("사업자회원 접속");
		

		
		return "/view/mypage/mypageBUSINESS.jsp";
		
	}

}
