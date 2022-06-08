package com.zumuniyo.menu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.util.DBUtil;

public class MenuDAO {
	
	
	// 1. 모든메뉴조회
	// 2. 카테고리별 조회
	// 3. 추천메뉴만 조회
	// 4. 인기순으로 조회
	// 5. 특정메뉴이름 조회
	// 6. insert
	// 7. delete
	// 8. 메뉴수정
	
	
	static final String SQL_SELECT_ALL = "select * from Z_MENU where not(menu_status='비활성') order by 1 desc" ;
	
	static final String SQL_SELECT_CATEGORYALL = "SELECT menu_category FROM Z_MENU GROUP BY MENU_CATEGORY"  ;
	static final String SQL_SELECT_BYCATEGORY = "select * from Z_MENU where not(menu_status='비활성') and MENU_CATEGORY=? " ;
	static final String SQL_SELECT_BYHITMENU = "select * from Z_MENU where not(menu_status='비활성') and MENU_TOP=1 " ;
	static final String SQL_SELECT_BYINTEREST = "" ;
	static final String SQL_SELECT_BYNAME = "select * from Z_MENU where not(menu_status='비활성') and MENU_NAME like ? " ;
	static final String SQL_INSERT = "INSERT INTO Z_MENU(MENU_SEQ, MENU_CATEGORY, SHOP_SEQ, MENU_NAME, MENU_PRICE, MENU_IMG, MENU_TOP, MENU_INFO, MENU_STATUS ) "
			+ " values(MENU_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, '활성')" ;
	static final String SQL_DELETE = "UPDATE Z_MENU SET MENU_STATUS='비활성' WHERE MENU_SEQ=?" ;
	
	static final String SQL_UPDATE = "";
	
	
	
	Connection conn;
	Statement st;
	ResultSet rs;
	PreparedStatement pst;
	
	int result;
	
	
	private MenuDTO makeMenu(ResultSet rs) throws SQLException {
		
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
	
	
	
	
	
	public List<MenuDTO> selectAll() {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_ALL);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				mlist.add(makeMenu(rs));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return mlist;
		
	}
	
	
	public List<String> selectCategoryAll() {
		
		List<String> menulist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_CATEGORYALL);
			rs = pst.executeQuery();
		
			while(rs.next()) {
			
				menulist.add(rs.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}

		
		return menulist ;
	}
	
	
	

	public List<MenuDTO> selectByCategory(String category) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
			
		
		
		try {
			
			pst = conn.prepareStatement(SQL_SELECT_BYCATEGORY);
			
			pst.setString(1, category);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				mlist.add(makeMenu(rs));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return mlist;
		
	}
	
	
	public List<MenuDTO> selectByHitMenu() {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYHITMENU);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				mlist.add(makeMenu(rs));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return mlist;
		
		
	}
	
	public List<MenuDTO> selectByInterest() {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYINTEREST);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				mlist.add(makeMenu(rs));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return mlist;
		
		
	}
	
	public List<MenuDTO> selectByName(String name) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYNAME);
			
			pst.setString(1, "%"+name+"%");
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				mlist.add(makeMenu(rs));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return mlist;
		
		
	}
	
	public int insert(MenuDTO menu) {
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setString(1, menu.getMenu_category());
			pst.setInt(2, menu.getShop_seq());
			pst.setString(3, menu.getMenu_name());
			pst.setInt(4, menu.getMenu_price());
			pst.setString(5, menu.getMenu_img());
			pst.setInt(6, menu.getMenu_top());
			pst.setString(7, menu.getMenu_info());
			
			
			
			result = pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
		
		
	}
	
	public int delete(int num) {
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_DELETE);
			
			pst.setInt(1, num);
			
			result = pst.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
	
		return result;
		
		
	}

	public int update(MenuDTO menu) {
		conn = DBUtil.getConnection();
		try {
			
			pst = conn.prepareStatement(SQL_UPDATE);
            pst.setString(1, menu.getMenu_category());
            pst.setString(2, menu.getMenu_name());
            pst.setInt(3, menu.getMenu_price());
            pst.setString(4, menu.getMenu_img());
            pst.setInt(5, menu.getMenu_top());
            pst.setString(6, menu.getMenu_info());
            
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}		
		return result;
	}
	

	
}
	
	
	
	
	



