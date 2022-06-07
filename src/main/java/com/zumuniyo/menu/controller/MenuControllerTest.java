package com.zumuniyo.menu.controller;

import java.util.Scanner;

import com.zumuniyo.menu.model.MenuService;
import com.zumuniyo.menu.model.MenuView;

public class MenuControllerTest {
	
	static MenuService mService = new MenuService();
	static Scanner sc = new Scanner(System.in);
	static boolean flag = true ;
	
	
	public static void main(String[] args) {
		// 
		
		while(flag) {
			String selectNO = controlMenu();
			switch (selectNO) {
			
			case "1": f1(); break;
			case "2": f2(); break;
			case "3": f3(); break;
			case "4": f4(); break;
			case "5": f5(); break;
			case "6": f6(); break;
			case "7": f7(); break;
			case "0": flag=false; break;
			
			}
			
		}
		System.out.println("종료...");
	}
	
	
	private static String controlMenu() {
		
		System.out.println("1. 모든메뉴조회");
		System.out.println("2. 카테고리별 조회");
		System.out.println("3. 추천메뉴만 조회");
		System.out.println("4. 인기순으로 조회");
		System.out.println("5. 특정메뉴이름 조회");
		System.out.println("6. insert");
		System.out.println("7. delete");
		System.out.println("0. 초기화면");
		
		
		return sc.nextLine();
	}
	
	
	
	
	
	
	
	
	
	private static void f7() {
		// TODO Auto-generated method stub
		
	}

	private static void f6() {
		// TODO Auto-generated method stub
		
	}

	private static void f5() {
		// TODO Auto-generated method stub
		
	}

	private static void f4() {
		// TODO Auto-generated method stub
		
	}

	private static void f3() {
		// TODO Auto-generated method stub
		
	}

	private static void f2() {
		// TODO Auto-generated method stub
		
	}

	
	
	private static void f1() {
		MenuView.print(mService.selectAll());
		
	}
	
}
