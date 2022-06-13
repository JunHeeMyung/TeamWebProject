package com.zumuniyo.common.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.common.dto.CommonDTO;
import com.zumuniyo.util.DBUtil;

public class CommonDAO {
	
	private Connection conn;
	private Statement st;
	private ResultSet rs;
	private ResultSetMetaData rsmd;
	private String sql;
	
	public CommonDAO() {}

	public CommonDAO(String sql) {
		this.sql = sql;
	}
	
	public void setSql(String sql) {
		this.sql = sql;
	}
	
	public JSONArray getJSON() {
		
		JSONArray jsonArray = null;
		
		try {
			      
			   // first,last 사용시 파라메터 추가설정해야함
			   conn = DBUtil.getConnection();
			   st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   rs = st.executeQuery(sql);
			   rsmd = rs.getMetaData();

			   // 로우수 구하기
			   rs.last();
			   int row = rs.getRow();
			   rs.beforeFirst();
			   // 컬럼수 구하기
			   int col = rsmd.getColumnCount();
			   jsonArray = new JSONArray();
			   // 결과 출력
			   while (rs.next()) {
				  JSONObject jsonObject = new JSONObject(); 
			      for (int c = 1; c <= col; c++) {
			    	  jsonObject.put(rsmd.getColumnName(c),rs.getString(c));
			      }
			      jsonArray.add(jsonObject);
			   }

			} catch (SQLException e) {
			   e.printStackTrace();
			} finally {
			   DBUtil.dbClose(rs, st, conn);
			}
		
		return jsonArray;

	}
	
	public List<CommonDTO> getDTO() {
	
		List<CommonDTO> commonList = null;
		
		try {
			      
			   // first,last 사용시 파라메터 추가설정해야함
			   conn = DBUtil.getConnection();
			   st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   rs = st.executeQuery(sql);
			   rsmd = rs.getMetaData();

			   // 로우수 구하기
			   rs.last();
			   int row = rs.getRow();
			   rs.beforeFirst();
			   // 컬럼수 구하기
			   int col = rsmd.getColumnCount();
			   commonList = new ArrayList<CommonDTO>();
			   // 결과 출력
			   while (rs.next()) { 
				  CommonDTO commonDTO = new CommonDTO();
			      for (int c = 1; c <= col; c++) {
			    	  commonDTO.setData(rsmd.getColumnName(c),rs.getString(c));
			      }
			      commonList.add(commonDTO);
			   }

			} catch (SQLException e) {
			   e.printStackTrace();
			} finally {
			   DBUtil.dbClose(rs, st, conn);
			}
		
		return commonList;
	
	}

}
