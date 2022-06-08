package com.zumuniyo.shop.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.util.DBUtil;

public class ShopDAO {
	static final String SQL_SELECT_ALL = "select * from Z_SHOP order by 1";
	// static final String SQL_SELECT_ALL = "select * from z-shop join (지명) where 위도-0.05 <= y and y <= 위도 +0.05 and 경도-0.05 <= 경도+0.05";
	
	static final String SQL_SELECT_LOCATION = "select * from z_shop join z_location where LOC_LAT-0.05 <= ? and ?<= LOC_LAT+0.05 and LOC_LON-0.05 <= ? and ? <= LOC_LON +0.05 order by 1";
	
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
			shopDTO.setShop_img(rs.getString("shop_img"));
			return shopDTO;
		}
}