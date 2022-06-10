package com.zumuniyo.member.model;

import java.sql.*;

import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.util.DBUtil;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	static final String SQL_SELECT_BY_EMAIL = "SELECT * FROM Z_MEMBER WHERE MEM_EMAIL = ?";
	static final String SQL_SELECT_BY_NICK = "SELECT * FROM Z_MEMBER WHERE MEM_NICK = ?";
	static final String SQL_SELECT_BY_ID = "SELECT * FROM Z_MEMBER WHERE MEM_ID = ?";
	
	public MemberDTO makeMember(ResultSet rs) throws SQLException {

		MemberDTO member = new MemberDTO();
		
		member.setMem_seq(rs.getInt("MEM_SEQ"));
		member.setMem_id(rs.getString("MEM_ID"));
		member.setMem_nick(rs.getString("MEM_NICK"));
		member.setMem_email(rs.getString("MEM_EMAIL"));
		member.setMem_salt(rs.getString("MEM_SALT"));
		member.setMem_type(rs.getString("MEM_TYPE"));
		member.setMem_status(rs.getString("MEM_STATUS"));
		
		return member;
	}

	public MemberDTO selectByEmail(String email) {

		MemberDTO member = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_EMAIL);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next())
				member = makeMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return member;
	}
	
	public MemberDTO selectByNick(String nick) {

		MemberDTO member = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_NICK);
			pst.setString(1, nick);
			rs = pst.executeQuery();
			if (rs.next())
				member = makeMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return member;
	}
	
	public MemberDTO selectById(String id) {

		MemberDTO member = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ID);
			pst.setString(1, id);
			rs = pst.executeQuery();
			if (rs.next())
				member = makeMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return member;
	}

}
