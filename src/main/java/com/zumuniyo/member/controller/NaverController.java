package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class NaverController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		return "/view/login/naver/callback.jsp";
	}
}
