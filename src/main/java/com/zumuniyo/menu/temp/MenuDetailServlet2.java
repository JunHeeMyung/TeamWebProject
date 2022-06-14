package com.zumuniyo.menu.temp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;

/**
 * Servlet implementation class MenuDetailServlet2
 */
//@WebServlet("/view/menu/menuDetail2.do")
public class MenuDetailServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String menuid = request.getParameter("menuid");
		
		int i_menuid = 0;
		
		if(menuid != null) {
			
			i_menuid = Integer.parseInt(menuid);
		}
		
		MenuService mService = new MenuService();
		
		MenuDTO menu = mService.selectByMenuId(i_menuid);
		
		// JSON 객체 만들기
		
		JSONObject obj = new JSONObject();   // 오브젝트 생성=> {}
		
		obj.put("menu_id", menu.getMenu_seq());
		obj.put("menu_name", menu.getMenu_name());
		obj.put("menu_info", menu.getMenu_info());
		obj.put("menu_img", menu.getMenu_img());
		obj.put("menu_price", menu.getMenu_price());
		
		String jsonStr = obj.toJSONString();
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		
		writer.print(jsonStr);
		
	}

}
