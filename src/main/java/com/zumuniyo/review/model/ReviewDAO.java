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
	
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_REVIEW ORDER BY 1";
	static final String SQL_SELECT_MemSeq = "SELECT * FROM Z_REVIEW WHERE MEM_SEQ = ?";
	static final String SQL_SELECT_MenuSeq = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ = ?";
	static final String SQL_SELECT_ShopSeq = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ IN (SELECT MENU_SEQ FROM Z_MENU WHERE SHOP_SEQ = ?) AND REVIEW_EXPOSURE = 1";
	static final String SQL_UPDATE_REVIEW_EXPOSURE = "UPDATE Z_REVIEW SET REVIEW_EXPOSURE = ? WHERE REVIEW_SEQ = ?";
	static final String SQL_DELETE_REVIEW = "DELETE FROM Z_REVIEW WHERE REVIEW_SEQ = ?";
	
	static final String SQL_INSERT_REVIEW  = "INSERT INTO Z_REVIEW VALUES(REVIEW_SEQ.nextval,?,?,?,?,?,?,?,sysdate,0)";
	static final String SQL_INSERT_REVIEW2 = "INSERT INTO Z_REVIEW VALUES(REVIEW_SEQ.nextval,NULL,NULL,?,?,?,?,?,sysdate,0)";
	
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

	
	public int reviewInsert(ReviewDTO reviewDTO)
	{
		int result = 0;
		
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_INSERT_REVIEW2);
			//pst.setInt(1, reviewDTO.getMem_seq());
			//pst.setInt(2, reviewDTO.getMenu_seq());
			pst.setFloat(1, reviewDTO.getReview_taste());
			pst.setFloat(2, reviewDTO.getReview_amount());
			pst.setFloat(3, reviewDTO.getReview_service());
			pst.setString(4, reviewDTO.getReview_content());
			pst.setString(5, reviewDTO.getReview_img());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
	
	
	public int reviewInsert2(ReviewDTO reviewDTO)
	{
		int result = 0;

		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_INSERT_REVIEW);
			pst.setInt(1, reviewDTO.getMem_seq());
			pst.setInt(2, reviewDTO.getMenu_seq());
			pst.setFloat(3, reviewDTO.getReview_taste());
			pst.setFloat(4, reviewDTO.getReview_amount());
			pst.setFloat(5, reviewDTO.getReview_service());
			pst.setString(6, reviewDTO.getReview_content());
			pst.setString(7, reviewDTO.getReview_img());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}
	

	public int reviewUpdate_1(ReviewDTO reviewDTO)
	{
		int result = 0;

		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_UPDATE_REVIEW_EXPOSURE);			
			pst.setInt(1, 1);
			pst.setInt(2, reviewDTO.getReview_seq());			
			result = pst.executeUpdate();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}

		return result;
	}
	
	public int reviewUpdate_0(ReviewDTO reviewDTO)
	{
		int result = 0;
		
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_UPDATE_REVIEW_EXPOSURE);			
			pst.setInt(1, 0);
			pst.setInt(2, reviewDTO.getReview_seq());			
			result = pst.executeUpdate();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}
		
		return result;
	}
	
	
	//SQL_DELETE_REVIEW
	public int reviewDelete(ReviewDTO reviewDTO)
	{
		int result = 0;
		
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_DELETE_REVIEW);			
			pst.setInt(1, reviewDTO.getReview_seq());			
			
			result = pst.executeUpdate();
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
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
