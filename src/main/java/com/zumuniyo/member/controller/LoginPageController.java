package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zumuniyo.common.Command;

public class LoginPageController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		// 비로그인시
		
		if(session.getAttribute("member")==null) {
			return "/view/member/login.jsp";
		}
		
		// 로그인시
		
		String nextpage = (String)request.getAttribute("nextpage");
		
		if(nextpage==null||nextpage.equals("")) {
			// 이동할 경로가 없으면 메인으로
			return "redirect:"+"/";
		}else {
			// 이동할 경로가 있으면 해당경로로
			return "redirect:"+nextpage;
		}

	}

}