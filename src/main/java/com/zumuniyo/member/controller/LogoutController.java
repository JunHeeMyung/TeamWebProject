package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.zumuniyo.common.Command;

public class LogoutController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.setAttribute("member", null);
		
		String nextpage = (String)session.getAttribute("nextpage");
		
		if(nextpage==null||nextpage.equals("")) {
			// 이동할 경로가 없으면 메인으로
			return "redirect:"+request.getContextPath()+"/";
		}else {
			// 이동할 경로가 있으면 해당경로로
			return "redirect:"+request.getContextPath()+nextpage;
		}
	}
}