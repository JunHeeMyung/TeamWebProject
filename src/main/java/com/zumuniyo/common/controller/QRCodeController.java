package com.zumuniyo.common.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;

public class QRCodeController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
	
		return "/view/common/qrcode.jsp";
	}

}
