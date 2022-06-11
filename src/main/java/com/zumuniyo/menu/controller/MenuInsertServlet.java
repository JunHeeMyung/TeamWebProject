package com.zumuniyo.menu.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;

@WebServlet("/view/menu/menuInsert.do")
public class MenuInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		
		
		
		MenuService mService = new MenuService();
		
		int menu_seq = 0;
		
		request.setAttribute("menulist", mService.selectByMenuId(menu_seq));
		
		
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher("menuInsert.jsp");

		rd.forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력하기
		MenuDTO menu = makeMenu(request);
		MenuService mService = new MenuService();
		
		int result = mService.insert(menu);
		
		request.setAttribute("menuMessage", result>0?"메뉴정보입력성공":"메뉴정보입력실패");
		
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher("menuResult.jsp");
		
		rd.forward(request, response);
		
	}
	
	
	
	private MenuDTO makeMenu(HttpServletRequest request) {
		
		MenuDTO menu = new MenuDTO(); 
		
		int menu_seq = readInt(request, "menu_seq");
		int shop_seq = readInt(request, "shop_seq");
		int menu_price = readInt(request, "menu_price");
		int menu_top = readInt(request, "menu_top");
		String menu_category = request.getParameter("menu_category"); 
		String menu_name = request.getParameter("menu_name");
		String menu_img = request.getParameter("menu_img");
		String menu_info = request.getParameter("menu_info");
		String menu_status = request.getParameter("menu_status"); 
		
		menu.setMenu_seq(menu_seq);
		menu.setMenu_category(menu_category);
		menu.setShop_seq(shop_seq);
		menu.setMenu_name(menu_name);
		menu.setMenu_price(menu_price);
		menu.setMenu_img(menu_img);
		menu.setMenu_top(menu_top);
		menu.setMenu_info(menu_info);
		menu.setMenu_status(menu_status);
		
		
		return menu;
		
	}
	
	
	private int readInt(HttpServletRequest request, String column) {
		
		
		
		String data = request.getParameter(column);
		
		return (data==null||data.equals(""))?0:Integer.parseInt(data);
	
	}
	
	
	
	
}