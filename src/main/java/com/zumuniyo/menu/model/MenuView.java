package com.zumuniyo.menu.model;

import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;

public class MenuView {
	
	public static void print(List<MenuDTO> menulist) {
		System.out.println("해당하는 데이터를 전부 출력...");
		for(MenuDTO menu : menulist) {
			
			System.out.println(menu);
		}
		
	}
	
	
	public static void print(MenuDTO menu) {
		System.out.println("데이터를 1건 출력...");
		
		System.out.println(menu);
		
	}
	
	public static void print(String message) {
		System.out.println("*** 메세지 출력 ***");
		System.out.println(message);
	}
	
	

}
