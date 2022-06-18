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
	
	static final String SQL_SELECT_CATEGORYALL = "SELECT menu_category FROM Z_MENU where shop_seq=? GROUP BY MENU_CATEGORY " ;
	//static final String SQL_SELECT_BYCATEGORY = "select * from Z_MENU where not(menu_status='비활성') and MENU_CATEGORY=? and shop_seq=? " ;
	static final String SQL_SELECT_BYHITMENU = "select * from Z_MENU where not(menu_status='비활성') and MENU_TOP=1 and shop_seq=? " ;
	static final String SQL_SELECT_BYINTEREST = "" ;
	static final String SQL_SELECT_BYNAME = "select * from Z_MENU where not(menu_status='비활성')and MENU_NAME like ? and shop_seq=? " ;
	
	
	static final String SQL_INSERT = "INSERT INTO Z_MENU(MENU_SEQ, MENU_CATEGORY, SHOP_SEQ, MENU_NAME, MENU_PRICE, MENU_IMG, MENU_TOP, MENU_INFO, MENU_STATUS ) "
			+ " values(MENU_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, '활성')" ;
	static final String SQL_DELETE = "UPDATE Z_MENU SET MENU_STATUS='비활성' WHERE MENU_SEQ=?" ;
	
	static final String SQL_UPDATE = "UPDATE Z_MENU SET MENU_CATEGORY=?, MENU_NAME=?, MENU_PRICE=?, MENU_IMG=?, MENU_TOP=?, MENU_INFO=? "
			+ " WHERE not(menu_status='비활성') and MENU_SEQ=? ";
	
	static final String SQL_SELECT_BYMENUID = "select * from Z_MENU where not(menu_status='비활성') and menu_seq=?";
	
	static final String SQL_SELECT_SHOPALL = "select * from Z_MENU where not(menu_status='비활성') and shop_seq=? order by MENU_CATEGORY desc";
	
	static final String SQL_SELECT_SHOPALL2 = "select * from Z_MENU where not(menu_status='비활성') and shop_seq=? order by MENU_SEQ desc";
	
	static final String SQL_SELECT_BYCATEGORY = "SELECT * FROM Z_MENU WHERE MENU_CATEGORY = ? AND SHOP_SEQ = ? AND MENU_STATUS = '활성' ";
	
	
	
	
	
	
	
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
	
	
	
	
	// 사실상 안씀... 모든메뉴조회(삭제된건 안뜸)
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
	
	
	public List<String> selectCategoryAll(int shop_seq) {
		
		List<String> menulist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_CATEGORYALL);
			
			pst.setInt(1, shop_seq);
			
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
	
	
	

	public List<MenuDTO> selectByCategory(String category, int shop_seq) {
		
		List<MenuDTO> menulist = null;
		
		conn = DBUtil.getConnection();
		
		
		try {
			
			pst = conn.prepareStatement(SQL_SELECT_BYCATEGORY);
			
			pst.setString(1, category);
			
			pst.setInt(2, shop_seq);
			
			rs = pst.executeQuery();
			
			while(rs.next()) {
				if(menulist==null) {
					menulist = new ArrayList<>();
				}
				menulist.add(makeMenu(rs));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
		}
		
	
		return menulist;
		
	}
	
	
	public List<MenuDTO> selectByHitMenu(int shop_seq) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYHITMENU);
			
			pst.setInt(1, shop_seq);
			
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
	
	
	public List<MenuDTO> selectByName(String name, int shop_seq) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BYNAME);
			
			pst.setString(1, "%"+name+"%");
			pst.setInt(2, shop_seq);
			
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//------------------------------------------------
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
	//-------------------------------------------------
	
	
	
	
	
	
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
            pst.setInt(7, menu.getMenu_seq());
            
            
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}		
		return result;
	}
	
	
	
	//
	public MenuDTO selectByMenuId(int menuid) {
		
		MenuDTO menu = null;
		conn = DBUtil.getConnection();
		
		try {
			
			pst = conn.prepareStatement(SQL_SELECT_BYMENUID);
			pst.setInt(1, menuid);
			rs = pst.executeQuery();
			
			while(rs.next()) {
				
				menu = makeMenu(rs);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			DBUtil.dbClose(rs, pst, conn);
			
		}
		
		return menu;
	}
	
	
	
	public List<MenuDTO> selectShopAll(int shop_seq) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_SHOPALL);
			pst.setInt(1, shop_seq);
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
	
	
	public List<MenuDTO> selectShopAll2(int shop_seq) {
		
		List<MenuDTO> mlist = new ArrayList<>();
		
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_SHOPALL2);
			pst.setInt(1, shop_seq);
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
	
	
	
	
}
	
	
	
	
	



