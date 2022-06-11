package com.zumuniyo.security.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.zumuniyo.security.dto.SecurityDTO;
import com.zumuniyo.util.DBUtil;

public class SecurityDAO {


	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	static final String SQL_SELECT_HASH_BY_MEM_SEQ = "SELECT SEC_HASH FROM Z_SECURITY WHERE MEM_SEQ = ?";
	static final String SQL_INSERT = "INSERT INTO Z_SECURITY VALUES (?,?)";
	static final String SQL_UPDATE = "UPDATE Z_SECURITY SET SEC_HASH = ? WHERE MEM_SEQ = ?";
	
	public SecurityDTO makeSecurity(ResultSet rs) throws SQLException {

		SecurityDTO security = new SecurityDTO();
		
		security.setMem_seq(rs.getInt("MEM_SEQ"));
		security.setSec_hash(rs.getString("SEC_HASH"));
		
		return security;
	}

	public String selectHashByMemSeq(int mem_seq) {

		String hash = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_HASH_BY_MEM_SEQ);
			pst.setInt(1, mem_seq);
			rs = pst.executeQuery();
			if (rs.next())
				hash = rs.getString("SEC_HASH");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return hash;
	}
	
	
	public int insertSecurity(SecurityDTO securityDTO) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			
			pst.setInt(1, securityDTO.getMem_seq());
			pst.setString(2, securityDTO.getSec_hash());
			
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}
	
	public int updateSecurity(SecurityDTO securityDTO) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_UPDATE);
			
			pst.setString(1, securityDTO.getSec_hash());
			pst.setInt(2, securityDTO.getMem_seq());
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;

	}

}
