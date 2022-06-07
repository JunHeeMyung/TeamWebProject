package com.zumuniyo.menu.model;

import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;

public class MenuService {
	
	MenuDAO dao = new MenuDAO();
	
	public List<MenuDTO> selectAll(){
		
		return dao.selectAll();
	}
	
	

}
