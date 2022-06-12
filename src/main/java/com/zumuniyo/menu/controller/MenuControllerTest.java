package com.zumuniyo.menu.controller;

import java.util.List;
import java.util.Scanner;

import com.zumuniyo.menu.dto.MenuDTO;
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
			case "8": f8(); break;
			case "9": f9(); break;
			case "10": f10(); break;
			case "0": flag=false; break;
			
			}
			
		}
		System.out.println("종료...");
		System.exit(0);
	}
	
	
	


	



	private static String controlMenu() {
		
		System.out.println("----<<< 컨트롤메뉴 >>>----");
		
		System.out.println("1. 모든메뉴조회");
		System.out.println("2. 카테고리별 조회");
		System.out.println("3. 추천메뉴만 조회");
		System.out.println("4. 인기순으로 조회");
		System.out.println("5. 특정메뉴이름 조회");
		System.out.println("6. insert");
		System.out.println("7. delete");
		System.out.println("8. 기존메뉴수정");
		System.out.println("9. menu_seq로 검색");
		System.out.println("10. shop_seq로 검색");
		System.out.println("0. 종료");
		
		
		return sc.nextLine();
	}
	
	
	
	private static void f10() {
		
		System.out.println("검색할 메뉴의 매장ID를 입력하세요 >> ");
		int shop_seq = Integer.parseInt(sc.nextLine());
		
		MenuView.print(mService.selectShopAll(shop_seq));
		
	}
	
	
	private static void f9() {
		
		System.out.println("검색할 메뉴의 ID를 입력하세요 >> ");
		int menu_seq = Integer.parseInt(sc.nextLine());
		
		MenuView.print(mService.selectByMenuId(menu_seq));
		
	}


	private static void f8() {
		
		System.out.println("**** 기존 메뉴 수정 ****");
		
		System.out.println("수정할 메뉴의 menu_seq >> ");
		int menu_seq = Integer.parseInt(sc.nextLine());
		
		System.out.print("메뉴 카테고리를 입력하세요 >> ");
		String menu_category = sc.nextLine();
		
		System.out.print("메뉴 이름을 입력하세요 >> ");
		String menu_name = sc.nextLine();
		System.out.print("가격을 입력하세요 >> ");
		int menu_price = Integer.parseInt(sc.nextLine());
		System.out.print("첨부할 이미지주소를 입력하세요 >> ");
		String menu_img = sc.nextLine();
		System.out.print("추천메뉴 등록 여부를 입력하세요(등록:1, 미등록:0) >> ");
		int menu_top = Integer.parseInt(sc.nextLine());
		System.out.print("메뉴 소개문구를 입력하세요 >> ");
		String menu_info = sc.nextLine();
		
		
		MenuDTO menu = new MenuDTO(menu_seq, menu_category, menu_name, menu_price, menu_img, menu_top, menu_info);
		
		int result = mService.update(menu);
		
		MenuView.print(result + " 건이 수정되었습니다...");
		
	}
	
	
	
	private static void f7() {
		
		System.out.print("삭제할 메뉴의 menu_seq >> ");
		int menu_seq = Integer.parseInt(sc.nextLine());
		
		int result = mService.delete(menu_seq);
		MenuView.print(result + " 건이 삭제되었습니다...");
		
	}

	private static void f6() {
		
		System.out.println("==== 신규 메뉴 등록 ====");
		
		System.out.print("메뉴 카테고리를 입력하세요 >> ");
		String menu_category = sc.nextLine();
		System.out.print("매장번호를 입력하세요 >> ");
		int shop_seq = Integer.parseInt(sc.nextLine());
		System.out.print("메뉴 이름을 입력하세요 >> ");
		String menu_name = sc.nextLine();
		System.out.print("가격을 입력하세요 >> ");
		int menu_price = Integer.parseInt(sc.nextLine());
		System.out.print("첨부할 이미지주소를 입력하세요 >> ");
		String menu_img = sc.nextLine();
		System.out.print("추천메뉴 등록 여부를 입력하세요(등록:1, 미등록:0) >> ");
		int menu_top = Integer.parseInt(sc.nextLine());
		System.out.print("메뉴 소개문구를 입력하세요 >> ");
		String menu_info = sc.nextLine();
		
		
		MenuDTO menu = new MenuDTO(menu_category, shop_seq, menu_name, menu_price, menu_img, menu_top, menu_info);
		
		int result = mService.insert(menu);
		
		MenuView.print(result + " 건이 입력되었습니다...");
	
	
	}

	private static void f5() {
		System.out.println("검색할 메뉴이름을 입력하세요 >> ");
		
		String menu_name = sc.nextLine();
		
		System.out.println("매장번호를 입력하세요 >> ");
		
		int shop_seq = Integer.parseInt(sc.nextLine());
		
		List<MenuDTO> mlist = mService.selectByName(menu_name, shop_seq);
		MenuView.print(mlist);
		
	}

	private static void f4() {
		System.out.println("판매순으로 정렬...");
		
		MenuView.print(mService.selectByInterest(""));
		
	}

	private static void f3() {
		System.out.print("추천메뉴로 등록된 메뉴를 표시합니다... ");
		
		System.out.println("매장번호를 입력하세요 >> ");
		
		int shop_seq = Integer.parseInt(sc.nextLine());
		
		
		MenuView.print(mService.selectByHitMenu(shop_seq));
		
	}

	private static void f2() {
		
		System.out.println("매장번호를 입력하세요 >> ");
		
		int shop_seq = Integer.parseInt(sc.nextLine());
		
		System.out.println("현재 입력된 매장번호의 카테고리를 표시합니다...");
		System.out.println("--------------------------");
		
		List<String> menulist= mService.selectCategoryAll(shop_seq);
		
		System.out.println(menulist);
		
		System.out.println("--------------------------");
		
		
		System.out.print("조회할 카테고리를 입력하세요 >> ");
		String menu_category = sc.nextLine();
		
		System.out.println("매장번호를 다시 한번 입력하세요 >> ");
		
		int shop_seq2 = Integer.parseInt(sc.nextLine());
		
		List<MenuDTO> mlist = mService.selectByCategory(menu_category, shop_seq2);
		MenuView.print(mlist);
		
		
	}

	
	
	private static void f1() {
		
		MenuView.print(mService.selectAll());
		
	}
	
}
