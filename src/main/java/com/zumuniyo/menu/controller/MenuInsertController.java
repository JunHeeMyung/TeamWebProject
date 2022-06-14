package com.zumuniyo.menu.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;
import com.zumuniyo.util.UploadUtil;

public class MenuInsertController implements Command {
	
	private static final String UPLOAD_DIR = "images";
	
	
	@Override
	public String execute(HttpServletRequest request) {
		
		if(request.getMethod().equals("GET")) {
			
			
			return "/view/menu/menuManageDesign.jsp";
			
		}
			
		 else if(request.getMethod().equals("POST")) {
		
			MenuDTO menuDTO = makeMenu(request);
			MenuService mService = new MenuService();
			
			System.out.println(menuDTO);
			
			
			if(request.getParameter("shop_seq")==null) {
				return "json:매장 시퀀스가 존재하지 않습니다";
			}
			
			String shop_seq = request.getParameter("shop_seq");
			
			char[] array = shop_seq.toCharArray();
			for(char c : array) {
				if(!Character.isDigit(c)) return "json:매장 시퀀스 입력값이 숫자가 아닙니다";
			}
			
			
			
			
			
			String dir = request.getServletContext().getRealPath(UPLOAD_DIR);
			System.out.println("업로드 폴더: "+dir);
			
			Map<String,Object> map = UploadUtil.uploadFile(UPLOAD_DIR, request);
			List<String> photos = (List<String>)map.get("photos");
			System.out.println("업로드 사진: "+photos);
			
			// 이후 파라메터 DB 입력
			Map<String,String> params = (Map<String,String>)map.get("params");
			for(String key:params.keySet()) {
				System.out.println(key+":"+params.get(key));
			}	
			menuDTO.setMenu_img(photos.get(0));
			
			int result = mService.insert(menuDTO);
			
			
			//request.setAttribute("menuMessage", result>0?"메뉴정보입력성공":"메뉴정보입력실패");
			
			return "redirect:"+request.getContextPath()+"/menu/menuManage.do?shop_seq="+shop_seq;
			
		}
		return "/view/menu/menuManageDesign.jsp";
		
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
