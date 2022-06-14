package com.zumuniyo.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.menu.temp.MenuCategoryController;
import com.zumuniyo.menu.temp.MenuListTopController;
import com.zumuniyo.menu.temp.MenuSearchController;





@WebServlet("/menu/*")
public class MenuFrontServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String method = request.getMethod();
		/* System.out.println("요청:"+uri+":"+method); */
		
		String page = "";
		
		Command command = null;
		
		if(uri.equals("/menu/menuListAll.do")) {
			command = new MenuListAllController();
		
		} else if(uri.equals("/menu/menuManage.do")) {
			command = new MenuManageController();	
			
			
		} else if(uri.equals("/menu/menuListTop.do")) {
			command = new MenuListTopController();
		
		} else if(uri.equals("/menu/menuCategory.do")) {
			command = new MenuCategoryController();
		
		} else if(uri.equals("/menu/menuSearch.do")) {
			command = new MenuSearchController();
			
			
		} else if(uri.equals("/menu/menuDetail.do")) {
			command = new MenuDetailController();
		/*
		} else if(uri.equals("/menu/menuCartList.do")) {
			command = new MenuCartListController();
		
		} else if(uri.equals("/menu/menuShopDetail.do")) {
			command = new MenuShopDetailController();
			
		} else if(uri.equals("/menu/menuFavorites.do")) {
			command = new MenuFavoritesController();
		
		*/	
			
			
			
		// ---나중에 메뉴관리에 추가할거---	
		} else if(uri.equals("/menu/menuInsert.do")) {
			command = new MenuInsertController();
		
			
			
		} else if(uri.equals("/menu/menuDelete.do")) {
			command = new MenuDeleteController();
		//---------------------------	
		
			
			
		}

		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}
		
		page = command.execute(request);
		
		if(page.indexOf("json:")>=0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(page.substring(5));
		}else if(page.indexOf("redirect:")>=0){
			response.sendRedirect(page.substring(9));
		}else {
			request.getRequestDispatcher(page).forward(request, response);
		}
		
		
		
		
		
	}

}
