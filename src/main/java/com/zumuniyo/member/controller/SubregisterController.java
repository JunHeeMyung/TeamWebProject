package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class SubregisterController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String type = (String)request.getAttribute("type");
		
		if(type==null||type.equals("")) {
			request.setAttribute("mem_id",request.getParameter("mem_id"));
			request.setAttribute("mem_email",request.getParameter("mem_email"));
		}
		
		return "/view/sublogin/subregister.jsp";
	}

}
