package com.zumuniyo.common.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.common.model.CommonService;

public class MapDataController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		CommonService commonService = new CommonService();

		return "json:"+commonService.getJSONforQuery("SELECT * FROM Z_SHOP JOIN Z_LOCATION USING(LOC_ADDR) WHERE SHOP_STATUS = '활성'");
	}
}