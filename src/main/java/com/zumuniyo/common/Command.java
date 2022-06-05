package com.zumuniyo.common;

import javax.servlet.http.HttpServletRequest;

public interface Command {

	public String execute(HttpServletRequest request);
	
}