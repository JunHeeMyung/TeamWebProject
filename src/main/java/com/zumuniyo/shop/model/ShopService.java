package com.zumuniyo.shop.model;

import java.util.List;

import com.zumuniyo.shop.dto.ShopDTO;

public class ShopService {

	ShopDAO shopDAO = new ShopDAO();
	
	public List<ShopDTO> selectShopAll() {
		return shopDAO.selectShopAll();
	}
		
	public List<ShopDTO> selectByLocation(double x, double y){
		return shopDAO.selectByLocation(x, y);
	}
	
	
	
}
