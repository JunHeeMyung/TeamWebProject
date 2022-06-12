package com.zumuniyo.menu.controller2;

import javax.servlet.http.HttpServletRequest;

public interface Command {

	public String execute(HttpServletRequest request);
	
}