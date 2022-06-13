package com.zumuniyo.member.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.util.DBUtil;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	static final String SQL_SELECT_BY_EMAIL = "SELECT * FROM Z_MEMBER WHERE MEM_EMAIL = ?";
	static final String SQL_SELECT_BY_NICK = "SELECT * FROM Z_MEMBER WHERE MEM_NICK = ?";
	static final String SQL_SELECT_BY_ID = "SELECT * FROM Z_MEMBER WHERE MEM_ID = ?";
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_MEMBER ORDER BY 1";
	static final String SQL_INSERT = "INSERT INTO Z_MEMBER VALUES (MEM_SEQ.NEXTVAL,?,?,?,?,?,'일반')";
	static final String SQL_UPDATE_NICK_BY_SEQ = "UPDATE Z_MEMBER SET MEM_NICK=? WHERE MEM_SEQ = ?";
	static final String SQL_UPDATE_STATUS_BY_SEQ = "UPDATE Z_MEMBER SET MEM_STATUS =? WHERE MEM_SEQ = ?"; 
	
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
	
	public int insertMember(MemberDTO memberDTO) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setString(1, memberDTO.getMem_id());
			pst.setString(2, memberDTO.getMem_nick());
			pst.setString(3, memberDTO.getMem_email());
			pst.setString(4, memberDTO.getMem_salt());
			pst.setString(5, memberDTO.getMem_type());
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}
	
	public int updateNickBySeq(String nick,int mem_seq) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setString(1, nick);
			pst.setInt(2, mem_seq);
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}
	
	public int updateStatusBySeq(String status,int mem_seq) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setString(1, status);
			pst.setInt(2, mem_seq);
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}
	
	public List<MemberDTO> selectAll() {

		List<MemberDTO> memberDTOs = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_ALL);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(memberDTOs==null) {
					memberDTOs = new ArrayList<MemberDTO>();
				}
				memberDTOs.add(makeMember(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return memberDTOs;
	}

}
