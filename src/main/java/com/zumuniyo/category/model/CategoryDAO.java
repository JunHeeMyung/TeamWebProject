package com.zumuniyo.category.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.category.dto.CategoryDTO;
import com.zumuniyo.util.DBUtil;

public class CategoryDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_CATEGORY ORDER BY 1";
	
	public CategoryDTO makeCategory(ResultSet rs) throws SQLException {

		CategoryDTO categoryDTO = new CategoryDTO();
		
		categoryDTO.setCategory_code(rs.getString("CATEGORY_CODE"));
		categoryDTO.setCategory_name(rs.getString("CATEGORY_NAME"));
		
		return categoryDTO;
	}
	
	public List<CategoryDTO> selectAll() {

		List<CategoryDTO> categoryDTOs = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_ALL);
			rs = pst.executeQuery();
			while (rs.next()){
				if(categoryDTOs==null) {
					categoryDTOs = new ArrayList<CategoryDTO>();
				}
				categoryDTOs.add(makeCategory(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return categoryDTOs;
	}


}
