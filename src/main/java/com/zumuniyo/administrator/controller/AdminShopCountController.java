package com.zumuniyo.administrator.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.model.CommonService;

public class AdminShopCountController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		CommonService commonService = new CommonService();
		
		System.out.println("AdminShopCountController");
		
		
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null || !loginInfo.get("mem_type").equals("관리자")) {
        	return "json:권한이 없습니다";
        }
        
        
		return "json:"+commonService.getJSONforQuery("SELECT \r\n"
				+ "(SELECT COUNT(SHOP_SEQ) FROM Z_SHOP WHERE SHOP_STATUS = '활성') 활성,\r\n"
				+ "(SELECT COUNT(SHOP_SEQ) FROM Z_SHOP WHERE SHOP_STATUS = '비활성') 비활성\r\n"
				+ "FROM Z_SHOP");
	}

}
