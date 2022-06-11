package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class LoginPageController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		return "/view/member/login.jsp";
	}

}