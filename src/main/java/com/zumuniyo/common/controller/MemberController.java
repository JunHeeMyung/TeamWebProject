package com.zumuniyo.common.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.common.model.CommonService;

public class MemberController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		CommonService commonService = new CommonService();
	
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null || !loginInfo.get("mem_type").equals("관리자")) {
        	return "json:권한이 없습니다";
        }
	
		return "json:"+commonService.getJSONforQuery("SELECT "
				+ " (SELECT count(*) AS 전체회원 FROM Z_MEMBER) 전체회원,\r\n"
				+ " (SELECT count(*) AS 사업자회원 FROM Z_MEMBER WHERE MEM_TYPE ='사업자회원') 사업자회원,"
				+ " (SELECT count(*) AS 일반회원 FROM Z_MEMBER WHERE MEM_TYPE ='일반회원') 일반회원,"
				+ " (SELECT count(*) AS naver FROM Z_MEMBER WHERE MEM_ID LIKE '%naver:%') 네이버회원,"
				+ " (SELECT count(*) AS kakao FROM Z_MEMBER WHERE MEM_ID LIKE '%kakao:%') 카카오회원 "
				+ " FROM dual");
	}

}
