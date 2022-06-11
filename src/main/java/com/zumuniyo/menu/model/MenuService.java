package com.zumuniyo.menu.model;

import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;

public class MenuService {
	
	MenuDAO dao = new MenuDAO();
	
	public List<MenuDTO> selectAll(){
		
		return dao.selectAll();
	}
	
	
	public List<String> selectCategoryAll() {
		
		return dao.selectCategoryAll();
	}
	
	
	
	public List<MenuDTO> selectByCategory(String category) {
		
		return dao.selectByCategory(category);
	}
	
	public List<MenuDTO> selectByHitMenu(String hit) {
		
		return dao.selectByHitMenu();
	}
	
	public List<MenuDTO> selectByInterest(String Interest) {
		
		return dao.selectByInterest();
	}
	
	public List<MenuDTO> selectByName(String name) {
		
		return dao.selectByName(name);
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
	
	
}
