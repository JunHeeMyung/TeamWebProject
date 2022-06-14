package com.zumuniyo.location.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.zumuniyo.location.dto.LocationDTO;
import com.zumuniyo.util.DBUtil;

public class LocationDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	static final String SQL_SELECT_BYADDR = "SELECT * FROM Z_LOCATION WHERE LOC_ADDR = ?";
	static final String SQL_INSERT = "INSERT INTO Z_LOCATION VALUES (?,?,?)";
	
	public LocationDTO makeLocation(ResultSet rs) throws SQLException {

		LocationDTO location = new LocationDTO();
		
		location.setLoc_addr(rs.getString("LOC_ADDR"));
		location.setLoc_lat(rs.getDouble("LOC_LAT"));
		location.setLoc_lon(rs.getDouble("LOC_LON"));

		return location;
	}
	
	public LocationDTO selectByAddr(String addr) {

		LocationDTO location = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BYADDR);
			pst.setString(1, addr);
			rs = pst.executeQuery();
			if (rs.next())
				location = makeLocation(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return location;
	}
	
	public int insertLocation(LocationDTO location) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setString(1, location.getLoc_addr());
			pst.setDouble(2, location.getLoc_lat());
			pst.setDouble(3, location.getLoc_lon());
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	
	}


}
