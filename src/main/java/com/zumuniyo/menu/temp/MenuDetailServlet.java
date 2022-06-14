package com.zumuniyo.menu.temp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;

/**
 * Servlet implementation class MenuDetailServlet2
 */
//@WebServlet("/view/menu/menuDetail.do")
public class MenuDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	
	//
	//
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String menuid = request.getParameter("menu_seq");
		
		int i_menuid = 0;
		
		if(menuid != null ) {
			
			i_menuid = Integer.parseInt(menuid);
		}
		
		MenuService mService = new MenuService();
		
		MenuDTO menu = mService.selectByMenuId(i_menuid);
		
		request.setAttribute("menu", menu);
		
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher("menuDetail.jsp");
		
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 수정하기
		
		MenuDTO menu = makeMenu(request) ;
		MenuService mService = new MenuService();
		
		int result = mService.update(menu);
		
		request.setAttribute("menuMessage", result>0?"메뉴수정에 성공하였습니다.":"메뉴수정에 실패하였습니다.");
		
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher("menuResult.jsp");
		
		rd.forward(request, response);
		
		
	}
	
	
	
	private MenuDTO makeMenu(HttpServletRequest request) {
		
		MenuDTO menu = new MenuDTO(); 
		
		int menu_seq = readInt(request, "menu_seq");
		int shop_seq = readInt(request, "shop_seq");
		int menu_price = readInt(request, "menu_price");
		int menu_top = readInt(request, "menu_price");
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
