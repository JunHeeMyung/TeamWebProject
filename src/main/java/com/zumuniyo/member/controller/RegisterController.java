package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class RegisterController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		return "/view/member/register.jsp";
	}

}
