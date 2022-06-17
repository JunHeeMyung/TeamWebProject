package com.zumuniyo.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.util.DBUtil;

public class ShopDAO {
	static final String SQL_SELECT_ALL = "select * from Z_SHOP order by 1";
	// static final String SQL_SELECT_ALL = "select * from z-shop join (지명) where 위도-0.05 <= y and y <= 위도 +0.05 and 경도-0.05 <= 경도+0.05";
	
	static final String SQL_SELECT_LOCATION = "select * from z_shop join z_location where LOC_LAT-0.05 <= ? and ?<= LOC_LAT+0.05 and LOC_LON-0.05 <= ? and ? <= LOC_LON +0.05 order by 1";
	
	static final String SQL_SELECT_SHOP = "select * from Z_SHOP where SHOP_SEQ = ?";
	
	static final String SQL_SELECT_MENU = "select * from Z_Menu where not(menu_status='비활성') and SHOP_SEQ = ?";
	
	
	static final String SQL_INSERT_SHOP = "insert into Z_SHOP VALUES(SHOP_SEQ.nextval,?,?,?, ?, ?, ?, ?, '활성')";
	static final String SQL_INSERT_SHOP_TEST = "insert into Z_SHOP VALUES(SHOP_SEQ.nextval,?,?,?, NULL, NULL, ?, ?, '활성')";
	
	static final String SQL_UPDATE = "UPDATE Z_SHOP SET SHOP_NAME = ?, LOC_ADDR=?, SHOP_ADDR_DETAIL=? , SHOP_IMG=? SHOP_NOTICE=? WHERE SHOP_SEQ=? ";
	
	static final String SQL_SELECT_MEM_SEQ = "SELECT * FROM Z_SHOP WHERE MEM_SEQ=?";
	
	static final String SQL_DELETE = "UPDATE Z_SHOP SET SHOP_STATUS = '비활성' WHERE SHOP_SEQ = ?";
	
	//insert INTO Z_SHOP VALUES(SHOP_SEQ.nextval, '멕시카나치킨', '서울특별시 금천구 가산디지털1로 70', '2층', NULL, NULL, NULL, NULL, '활성');
	/* static final String SQL_INSERT_SHOPIMG = "INSERT INTO Z_shop "; */
	/*


MEM_SEQ
CATEGORY_CODE

	  */
	 
	Connection conn;
	Statement st;
	PreparedStatement pst; // 바인딩변수지원
	ResultSet rs;
	int result;
	
	// 1. 모든 매장 조회
		public List<ShopDTO> selectShopAll() {
			List<ShopDTO> shopLists = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				st = conn.createStatement();
				rs = st.executeQuery(SQL_SELECT_ALL);
				
				while (rs.next()) {
					shopLists.add(makeShop(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}
			return shopLists;		
		}
		
		public List<ShopDTO> selectByLocation(double x, double y) {
			List<ShopDTO> shopLists = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				pst = conn.prepareStatement(SQL_SELECT_LOCATION);
				pst.setDouble(1, x);
				pst.setDouble(2, x);
				pst.setDouble(3, y);
				pst.setDouble(4, y);
				rs = pst.executeQuery();

				while (rs.next()) {
					shopLists.add(makeShop(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			return shopLists;
		}

		
		
		private ShopDTO makeShop(ResultSet rs) throws SQLException {
			ShopDTO shopDTO = new ShopDTO();
			shopDTO.setShop_seq(rs.getInt("shop_seq"));
			shopDTO.setShop_name(rs.getString("shop_name"));
			shopDTO.setLoc_addr(rs.getString("loc_addr"));
			shopDTO.setShop_addr_detail(rs.getString("shop_addr_detail"));
			/* shopDTO.setMem_seq(Integer.parseInt("mem_seq")); */
			shopDTO.setCategory_code(rs.getString("category_code"));
			shopDTO.setShop_img(rs.getString("shop_img"));
			shopDTO.setShop_notice(rs.getString("shop_notice"));
			shopDTO.setShop_status(rs.getString("Shop_status"));
			return shopDTO;
		}
		
		public List<ShopDTO> selectBySeq(int shop_seq) {
			List<ShopDTO> shoplist = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				pst = conn.prepareStatement(SQL_SELECT_SHOP);
				pst.setInt(1, shop_seq);
				rs = pst.executeQuery();

				while (rs.next()) {
					shoplist.add(makeShop(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			
			System.out.println("shoplist = "+shoplist);
			return shoplist;
		}
		
		public List<ShopDTO> selectByMem(int mem_seq) {
			List<ShopDTO> shoplist = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				pst = conn.prepareStatement(SQL_SELECT_MEM_SEQ);
				pst.setInt(1, mem_seq);
				rs = pst.executeQuery();

				while (rs.next()) {
					shoplist.add(makeShop(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			
			System.out.println("shoplist = "+shoplist);
			return shoplist;
		}
		// 모든 메뉴 조회
		public List<MenuDTO> selectByMenu(int shop_seq) {
			List<MenuDTO> menulist = new ArrayList<>();
			conn = DBUtil.getConnection();
			try {
				pst = conn.prepareStatement(SQL_SELECT_MENU);
				pst.setInt(1, shop_seq);
				rs = pst.executeQuery();

				while (rs.next()) {
					menulist.add(makeShopMenu(rs));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, pst, conn);
			}
			
			System.out.println("menulist = "+menulist);
			return menulist;
		}
		
		/*
		private int menu_seq;
		private String menu_category;
		private int shop_seq;
		private String menu_name;
		private int menu_price;
		private String menu_img;
		private int menu_top;
		private String menu_info;
		private String menu_status;
		*/
		
		private MenuDTO makeShopMenu(ResultSet rs) throws SQLException {
			
			MenuDTO menu = new MenuDTO();
			
			menu.setMenu_seq(rs.getInt("menu_seq"));
			menu.setMenu_category(rs.getString("menu_category"));
			menu.setShop_seq(rs.getInt("shop_seq"));
			menu.setMenu_name(rs.getString("menu_name"));
			menu.setMenu_price(rs.getInt("menu_price"));
			menu.setMenu_img(rs.getString("menu_img"));
			menu.setMenu_top(rs.getInt("menu_top"));
			menu.setMenu_info(rs.getString("menu_info"));
			menu.setMenu_status(rs.getString("menu_status"));
			
			return menu;
		}
		
		
		public int shopInsert(ShopDTO shopDTO)
		{
			int result = 0;
			
			conn = DBUtil.getConnection();
			try
			{
				pst = conn.prepareStatement(SQL_INSERT_SHOP);
				
				pst.setString(1, shopDTO.getShop_name());
				pst.setString(2, shopDTO.getLoc_addr());
				pst.setString(3, shopDTO.getShop_addr_detail());
				pst.setInt(4, shopDTO.getMem_seq());
				pst.setString(5, shopDTO.getCategory_code());
				pst.setString(6, shopDTO.getShop_img());
				pst.setString(7, shopDTO.getShop_notice());
				
				/*SHOP_IMG SHOP_NOTICE
				  "insert into Z_SHOP VALUES(SHOP_SEQ.nextval,?,?,?, NULL, NULL, ?, ?, '활성')";
				
				insert into Z_SHOP VALUES(SHOP_SEQ.nextval,?,?,?', NULL, NULL, NULL, NULL, '활성')"; 
SHOP_SEQ SHOP_NAME LOC_ADDR SHOP_ADDR_DETAIL MEM_SEQ CATEGORY_CODE SHOP_IMG SHOP_NOTICE SHOP_STATUS 
				 */
				
				
				result = pst.executeUpdate();
				
			} catch (SQLException e)
			{
				e.printStackTrace();
			} finally
			{
				DBUtil.dbClose(rs, pst, conn);
			}
			
			return result;
		}
		
		public int update(ShopDTO shopDTO) {
			conn = DBUtil.getConnection();
			try {
				//"UPDATE Z_SHOP SET SHOP_NAME = ?, LOC_ADDR=?, SHOP_ADDR_DETAIL=? , SHOP_IMG=? SHOP_NOTICE=? WHERE SHOP_SEQ=? ";
				pst = conn.prepareStatement(SQL_UPDATE);
				
	            pst.setString(1, shopDTO.getShop_name());
	            pst.setString(2, shopDTO.getLoc_addr());
	            pst.setString(3, shopDTO.getShop_addr_detail());
	            pst.setString(4, shopDTO.getShop_img());
	            pst.setString(5, shopDTO.getShop_notice());
	            pst.setInt(6, shopDTO.getShop_seq());
	            
	            result = pst.executeUpdate();			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}		
			return result;
		}
		
		public int delete(int shop_seq) {
			conn = DBUtil.getConnection();
			try {				
				pst = conn.prepareStatement(SQL_DELETE);			
	            pst.setInt(1, shop_seq);
	            
	            result = pst.executeUpdate();			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}		
			return result;
		}
		/*  	

		public int update(ShopDTO shopDTO) {
			conn = DBUtil.getConnection();
			try {
				
				pst = conn.prepareStatement(SQL_UPDATE);
				
	            pst.setString(1, shopDTO.getShop_name());
	            pst.setString(2, shopDTO.getLoc_addr());
	            pst.setString(3, shopDTO.getShop_addr_detail());
	            pst.setString(4, shopDTO.getShop_img());
	            pst.setString(5, shopDTO.getShop_notice());
	            
	            result = pst.executeUpdate();			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.dbClose(rs, st, conn);
			}		
			return result;
		}
		*/
}