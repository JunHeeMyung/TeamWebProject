package com.zumuniyo.menu.controller2;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.menu.model.MenuService;

public class SearchController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String method = request.getMethod();
		
		MenuService menuService = new MenuService();
		
		

		if(method.equals("GET")) {
			
			String searchtype=(String)request.getParameter("searchtype");
			
			if(searchtype==null||searchtype.equals("")) {
				return "json:검색타입값이 없습니다";
			}
			
			if(searchtype.equals("selectByShopseq")) {
				
				
				
				
			}else if(searchtype.equals("selectByMenuseq")) {
				
				
				
			}else if(searchtype.equals("selectByTop")) {
				
				
				
			}else if(searchtype.equals("selectByCategory")) {
				
				String category=(String)request.getParameter("category");
				if(category==null||category.equals("")) {
					return "json:카테고리값이 없습니다";
				}
				
				
				
				
			
				
				
				
			}else if(searchtype.equals("selectByMenuname")) {
				
				
				
			}

			
			

			
			
			
			
			return "asdfkjaklsd;jf/test.jsp";

		}else {
			
			
			
			
			
			
			
			
			
			
			return "asdfkjaklsd;jf/test.jsp";
			
		}

	}

}
