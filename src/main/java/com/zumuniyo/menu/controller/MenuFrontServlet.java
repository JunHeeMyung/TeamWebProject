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
		// QR메뉴출력화면으로 가기
		if(uri.equals("/menu/menuListAll.zmny")) {
			command = new MenuListAllController();
		// 메뉴관리페이지로 가기
		} else if(uri.equals("/menu/menuManage.do")) {
			command = new MenuManageController();	
			
		// QR메뉴에서 상위에 표시될 메뉴만 출력하기	
		} else if(uri.equals("/menu/menuListTop.do")) {
			command = new MenuListTopController();
		
		// 카테고리별로 group by 해서 출력하기
		} else if(uri.equals("/menu/menuCategory.do")) {
			command = new MenuCategoryController();
		
		// 특정 이름이 들어간 메뉴 검색해서 출력하기
		} else if(uri.equals("/menu/menuSearch.do")) {
			command = new MenuSearchController();
		
		// 각각의 메뉴 클릭했을 때 메뉴 상세값 출력하기
		} else if(uri.equals("/menu/menuDetail.do")) {
			command = new MenuDetailController();
		
		// 메뉴리스트를 JSON으로 넘겨주기
		} else if(uri.equals("/menu/menuListJSON.do")) {
			command = new MenuListJSONController();
			
		// 메뉴관리에서 메뉴 추가하기	
		} else if(uri.equals("/menu/menuInsert.do")) {
			command = new MenuInsertController();
		
		// 메뉴관리에서 특정메뉴 지우기
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
