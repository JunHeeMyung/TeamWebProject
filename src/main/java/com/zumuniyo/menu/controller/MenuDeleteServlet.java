package com.zumuniyo.menu.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.zumuniyo.menu.model.MenuService;

/**
 * Servlet implementation class EmpDeleteServlet
 */
@WebServlet("/view/menu/menuDelete.do")
public class MenuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		
		int menuid = Integer.parseInt(request.getParameter("menuid"));
		
		MenuService mService = new MenuService();
		
		int result = mService.delete(menuid);
		
		request.setAttribute("menuMessage", result>0?"삭제성공":"삭제실패");
		
		RequestDispatcher rd = request.getRequestDispatcher("menuResult.jsp");
		
		rd.forward(request, response);
		
	}

}
