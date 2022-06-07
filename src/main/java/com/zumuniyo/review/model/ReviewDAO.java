package com.zumuniyo.review.model;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.util.DBUtil;

public class ReviewDAO {
	
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_REVIEW";
	static final String SQL_SELECT_MemSeq = "SELECT * FROM Z_REVIEW WHERE MEM_SEQ = ?";
	static final String SQL_SELECT_MenuSeq = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ = ?";
	static final String SQL_SELECT_ShopSeq = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ IN (SELECT MENU_SEQ FROM Z_MENU WHERE SHOP_SEQ = ?) AND REVIEW_EXPOSURE = 1";
	
	
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;

	
	public List<ReviewDTO> selectAll()
	{
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_ALL);

			while (rs.next())
			{
				reviewDTOs.add(makeReview(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewDTOs;
	}
	
	public List<ReviewDTO> selectByMemSeq(int mem_seq)
	{
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MemSeq);
			pst.setInt(1, mem_seq);
			
			while (rs.next())
			{
				reviewDTOs.add(makeReview(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewDTOs;
	}
	
	
	public List<ReviewDTO> selectByMenuSeq(int menu_seq)
	{		
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MenuSeq);
			pst.setInt(1, menu_seq);
			
			while (rs.next())
			{
				reviewDTOs.add(makeReview(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewDTOs;
	}
	
	public List<ReviewDTO> selectByShopSeq(int shop_seq)
	{		
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_ShopSeq);
			pst.setInt(1, shop_seq);
			
			while (rs.next())
			{
				reviewDTOs.add(makeReview(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewDTOs;
	}
	
		
	
	private ReviewDTO makeReview(ResultSet rs) throws SQLException
	{
		ReviewDTO reviewDTO = new ReviewDTO();
		
		reviewDTO.setReview_seq(rs.getInt("review_seq"));
		reviewDTO.setMem_seq(rs.getInt("mem_seq"));
		reviewDTO.setMenu_seq(rs.getInt("menu_seq"));
		reviewDTO.setReview_taste(rs.getInt("review_taste"));
		reviewDTO.setReview_amount(rs.getInt("review_amount"));
		reviewDTO.setReview_service(rs.getInt("review_service"));
		reviewDTO.setReview_content(rs.getString("review_content"));
		reviewDTO.setReview_img(rs.getString("review_img"));
		reviewDTO.setReview_date(rs.getDate("review_date"));
		reviewDTO.setReview_exposure(rs.getInt("review_exposure"));
	
		return reviewDTO;
	}
	
	
	/*
	public ReviewDTO selectByMenuSeq(int menu_seq)
	{
		ReviewDTO reviewDTO = null;
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MenuSeq);
			pst.setInt(1, menu_seq); 
			
			rs = pst.executeQuery();
			
			while (rs.next())
			{
				reviewDTO = makeReview(rs);
			}
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}
		return reviewDTO;
	}
	*/
}
