package com.zumuniyo.review.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.model.CommonService;

public class ReviewDayCount implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		CommonService commonService = new CommonService();
	
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
        if(loginInfo==null || !loginInfo.get("mem_type").equals("관리자")) {
        	return "json:권한이 없습니다";
        }
	
		return "json:"+commonService.getJSONforQuery("SELECT TO_CHAR(b.dt, 'YYYY-MM-DD') AS REVIEW_DATE\r\n"
				+ "     , NVL(SUM(a.cnt), 0) cnt\r\n"
				+ "  FROM ( SELECT TO_CHAR(REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE\r\n"
				+ "              , COUNT(*) cnt\r\n"
				+ "           FROM Z_REVIEW\r\n"
				+ "          WHERE REVIEW_DATE BETWEEN TO_DATE('2022-06-08', 'YYYY-MM-DD')\r\n"
				+ "                             AND TO_DATE('2022-06-20', 'YYYY-MM-DD')\r\n"
				+ "          GROUP BY REVIEW_DATE\r\n"
				+ "        ) a\r\n"
				+ "      , ( SELECT TO_DATE('2022-06-08', 'YYYY-MM-DD') + LEVEL - 1 AS dt\r\n"
				+ "            FROM dual \r\n"
				+ "         CONNECT BY LEVEL <= (TO_DATE('2022-06-20', 'YYYY-MM-DD') \r\n"
				+ "                            - TO_DATE('2022-06-08', 'YYYY-MM-DD') + 1)\r\n"
				+ "        ) b\r\n"
				+ "  WHERE b.dt = a.REVIEW_DATE(+)\r\n"
				+ "  GROUP BY b.dt\r\n"
				+ "  ORDER BY b.dt");
	}

}
