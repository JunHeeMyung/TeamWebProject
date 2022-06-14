package com.zumuniyo.menu.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.menu.model.MenuService;

public class MenuDeleteController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		
		
		if(request.getMethod().equals("POST")) {
		
		
			
			
		int imenu_seq = Integer.parseInt(request.getParameter("menu_seq"));
		
		MenuService mService = new MenuService();
		
		
		if(request.getParameter("menu_seq")==null) {
			return "json:메뉴 시퀀스가 존재하지 않습니다";
		}
		
		String menu_seq = request.getParameter("menu_seq");
		
		char[] array = menu_seq.toCharArray();
		for(char c : array) {
			if(!Character.isDigit(c)) return "json:메뉴시퀀스 입력값이 숫자가 아닙니다";
		}
		
		
		
		int result = mService.delete(imenu_seq);
		
		if(result<=0) {
			
			return "json:삭제 대상이 존재하지 않습니다.";
		}
		
		//request.setAttribute("menuMessage", result>0?"메뉴를 삭제하였습니다.":"메뉴 삭제에 실패하였습니다.");
		
		//return "/view/menu/menuManageDesign.jsp";
		return "json:메뉴 삭제에 성공했습니다.";
		
		}
		
		else {
		
			
			
			return "/view/menu/menuManageDesign.jsp";
			
		}
		
		
	}
	

}
