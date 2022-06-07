package com.zumuniyo.util;

import java.sql.*;

public class DBUtil {
	
	public static Connection getConnection() {

		Connection conn = null;
		String url = DBProperties.URL;
		String userid = DBProperties.USERID, password = DBProperties.PASSWROD;
		try {
			Class.forName(DBProperties.DRIVER);
			conn = DriverManager.getConnection(url, userid, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void dbClose(ResultSet rs, Statement st, Connection conn) {

		try {
			if(rs != null) rs.close();
			if(st != null) st.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}