package com.zumuniyo.util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBUtil {

	public static Connection getConnection() {

		Context initContext = null;
		Connection conn = null;

		try {
			initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void dbClose(ResultSet rs, Statement st, Connection conn) {

		try {
			if (rs != null) rs.close();
			if (st != null) st.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
