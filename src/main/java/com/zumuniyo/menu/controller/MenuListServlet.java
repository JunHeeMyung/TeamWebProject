package com.zumuniyo.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;


@WebServlet("/view/menu/menuList.do")
public class MenuListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MenuService mService = new MenuService();
		
		List<MenuDTO> menulist = mService.selectAll();
		
		request.setAttribute("menuDatas", menulist);
		
		
		
		
		RequestDispatcher rd;
		
		rd = request.getRequestDispatcher("menuList.jsp");
		
		rd.forward(request, response);
		
		
	}
	

}
