package com.zumuniyo.menu.model;

import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;

public class MenuService {
	
	MenuDAO dao = new MenuDAO();
	
	public List<MenuDTO> selectAll(){
		
		return dao.selectAll();
	}
	
	
	
	public List<String> selectCategoryAll(int shop_seq) {
		
		return dao.selectCategoryAll(shop_seq);
	}
	
	
	
	public List<MenuDTO> selectByCategory(String category, int shop_seq) {
		
		return dao.selectByCategory(category, shop_seq);
	}
	
	public List<MenuDTO> selectByHitMenu(int shop_seq) {
		
		return dao.selectByHitMenu(shop_seq);
	}
	
	//----------------------------------------------------
	public List<MenuDTO> selectByInterest(String Interest) {
		
		return dao.selectByInterest();
	}
	//----------------------------------------------------
	
	
	public List<MenuDTO> selectByName(String name, int shop_seq) {
		
		return dao.selectByName(name, shop_seq);
	}
	
	public int insert(MenuDTO menu) {
		
		return dao.insert(menu);
	}
	
	public int delete(int num) {
		
		return dao.delete(num);
		
	}
	
	public int update(MenuDTO menu) {
		
		return dao.update(menu);
	}
	
	public MenuDTO selectByMenuId(int menuid) {
		
		return dao.selectByMenuId(menuid);
	}
	
	public List<MenuDTO> selectShopAll(int shop_seq) {
		
		return dao.selectShopAll(shop_seq);
	}
	
	public List<MenuDTO> selectShopAll2(int shop_seq) {
		
		return dao.selectShopAll2(shop_seq);
	}
}
