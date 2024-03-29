package com.zumuniyo.menu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.menu.model.MenuService;
import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;

public class MenuListAllController implements Command {
	
	@Override
	public String execute(HttpServletRequest request) {
			
			MenuService mService = new MenuService();
			
			if(request.getParameter("shop_seq")==null) {
				return "json:매장 번호가 없습니다";
			}
			
			String shop_seq = request.getParameter("shop_seq");
			
			char[] array = shop_seq.toCharArray();
			for(char c : array) {
				if(!Character.isDigit(c)) return "json:매장번호 입력값이 숫자가 아닙니다";
			}
			
			int ishop_seq = Integer.parseInt(shop_seq);
			
			
			List<MenuDTO> menuDTOs = mService.selectShopAll(ishop_seq);

			
			JSONArray jsonArray = new JSONArray();
			
				for(MenuDTO menuDTO:menuDTOs) {
					
					JSONObject jsonObject = new JSONObject();
					jsonObject.put("menu_seq", menuDTO.getMenu_seq());
					jsonObject.put("menu_category", menuDTO.getMenu_category());
					jsonObject.put("shop_seq", menuDTO.getShop_seq());
					jsonObject.put("menu_name", menuDTO.getMenu_name());
					jsonObject.put("menu_price", menuDTO.getMenu_price());
					jsonObject.put("menu_img", menuDTO.getMenu_img());
					jsonObject.put("menu_top", menuDTO.getMenu_top());
					jsonObject.put("menu_info", menuDTO.getMenu_info());
					jsonObject.put("menu_status", menuDTO.getMenu_status());
					jsonArray.add(jsonObject);
				}
				
				request.setAttribute("menuDTOs", jsonArray);
				
				ShopService shopService = new ShopService();
				List<ShopDTO> shoplist = shopService.selectBySeq(ishop_seq); 
				request.setAttribute("shop", shoplist.get(0));
				
				ReviewService reviewService = new ReviewService();
				double reviewlist = reviewService.selectAvgByShopSeq(ishop_seq);
				request.setAttribute("review", reviewlist);
				
				
			return "/view/menu/menuListFrontDesign.jsp";
		
	}
	
}
