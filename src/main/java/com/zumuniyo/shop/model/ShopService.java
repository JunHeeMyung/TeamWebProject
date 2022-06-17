package com.zumuniyo.shop.model;

import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.shop.dto.ShopDTO;

public class ShopService {

	ShopDAO shopDAO = new ShopDAO();
	
	public List<ShopDTO> selectShopAll() {
		return shopDAO.selectShopAll();
	}
		
	public List<ShopDTO> selectByLocation(double x, double y){
		return shopDAO.selectByLocation(x, y);
	}
	
	public List<ShopDTO> selectBySeq(int shop_seq) {
		return shopDAO.selectBySeq(shop_seq);
	}
	public List<MenuDTO> selectByMenu(int shop_seq) {
		return shopDAO.selectByMenu(shop_seq);
	}
	public int shopInsert(ShopDTO shopDTO) {
		return shopDAO.shopInsert(shopDTO);
	}
	public int shopUpdate(ShopDTO shopDTO) {
		return shopDAO.update(shopDTO);
	}
	public List<ShopDTO> selectByMem(int mem_seq) {
		return shopDAO.selectByMem(mem_seq);
	}
	public int delete(int shop_seq) {
		return shopDAO.delete(shop_seq);
	}

}
