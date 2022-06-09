package com.zumuniyo.emailcert.model;

import java.sql.*;

import com.zumuniyo.emailcert.dto.EmailcertDTO;
import com.zumuniyo.util.DBUtil;

public class EmailcertDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	static final String SQL_SELECT_EMAILCERT = "SELECT * FROM Z_EMAILCERT WHERE EMAIL_ADDR = ? AND EMAIL_CERTNUM = ? AND EMAIL_TYPE = ? AND (EMAIL_DATE + (3/1440)) > SYSDATE";
	static final String SQL_INSERT = "INSERT INTO Z_EMAILCERT VALUES (?,?,SYSDATE,?)";
	static final String SQL_DELETE = "DELETE FROM Z_EMAILCERT WHERE EMAIL_ADDR = ? AND EMAIL_TYPE = ?";
	
	public EmailcertDTO makeEmailCert(ResultSet rs) throws SQLException {

		EmailcertDTO emailcert = new EmailcertDTO();

		emailcert.setEmail_addr(rs.getString("EMAIL_ADDR"));
		emailcert.setEmail_certnum(rs.getString("EMAIL_CERTNUM"));
		emailcert.setEmail_date(rs.getDate("EMAIL_DATE"));
		emailcert.setEmail_type(rs.getString("EMAIL_TYPE"));

		return emailcert;
	}

	public boolean selectByEmailcertDTO(EmailcertDTO emailcert) {

		boolean result = false;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_EMAILCERT);
			pst.setString(1, emailcert.getEmail_addr());
			pst.setString(2, emailcert.getEmail_certnum());
			pst.setString(3, emailcert.getEmail_type());
			rs = pst.executeQuery();
			if (rs.next()) result = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	}

	public int insertEmailcert(EmailcertDTO emailcert) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_DELETE);
			pst.setString(1, emailcert.getEmail_addr());
			pst.setString(2, emailcert.getEmail_type());
			pst.executeUpdate();
			pst = conn.prepareStatement(SQL_INSERT);
			pst.setString(1, emailcert.getEmail_addr());
			pst.setString(2, emailcert.getEmail_certnum());
			pst.setString(3, emailcert.getEmail_type());
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}



}
