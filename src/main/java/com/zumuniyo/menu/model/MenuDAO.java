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
	
	
	
	static final String SQL_SELECT_ALL = "select * from Z_MENU order by 1 desc" ;
	static final String SQL_SELECT_BYCATEGORY = "" ;
	static final String SQL_SELECT_BYHITMENU = "" ;
	static final String SQL_SELECT_BYINTEREST = "" ;
	static final String SQL_SELECT_BYNAME = "" ;
	static final String SQL_INSERT = "" ;
	static final String SQL_DELETE = "" ;
	
	
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

	public List<MenuDTO> selectByCategory() {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYCATEGORY);
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
	
	public List<MenuDTO> selectByName() {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYNAME);
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
			pst.setString(8, menu.getMenu_status());
			
			
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
	
	
}
	
	
	
	
	



