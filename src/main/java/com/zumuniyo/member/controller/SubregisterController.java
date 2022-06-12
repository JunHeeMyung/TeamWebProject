package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class SubregisterController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		return "/view/sublogin/subregister.jsp";
	}

}
