package com.zumuniyo.review.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//import com.zumuniyo.menu.dto.MenuDTO;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.dto.ReviewMenuDTO;
import com.zumuniyo.review.dto.ReviewShopDTO;
import com.zumuniyo.util.DBUtil;

public class ReviewDAO {
	
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_REVIEW ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_MemSeq = "SELECT * FROM Z_REVIEW WHERE MEM_SEQ = ? ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_MenuSeq = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ = ? ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_MenuName = "SELECT MENU_NAME FROM Z_REVIEW WHERE MENU_SEQ = ? ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_MenuSeq2 = "SELECT * FROM Z_REVIEW NATURAL JOIN Z_MENU WHERE MENU_SEQ = ? ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_ShopSeq = "SELECT * FROM Z_REVIEW NATURAL JOIN Z_MENU WHERE SHOP_SEQ=? AND REVIEW_EXPOSURE = 1 ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_ShopSeq2 = "SELECT * FROM Z_REVIEW WHERE MENU_SEQ IN (SELECT MENU_SEQ FROM Z_MENU WHERE SHOP_SEQ = ?) AND REVIEW_EXPOSURE = 1 ORDER BY REVIEW_SEQ DESC" ;	
	static final String SQL_SELECT_ShopSeq_MANAGER = "SELECT * FROM Z_REVIEW NATURAL JOIN Z_MENU WHERE SHOP_SEQ=? ORDER BY REVIEW_SEQ DESC";
	
	static final String SQL_SELECT_REVIEW_SHOP_MEM = "SELECT * FROM Z_REVIEW WHERE REVIEW_SEQ IN (SELECT REVIEW_SEQ FROM Z_REVIEW WHERE MENU_SEQ IN (SELECT MENU_SEQ FROM Z_MENU WHERE SHOP_SEQ IN (SELECT SHOP_SEQ FROM Z_SHOP WHERE MEM_SEQ = ?))) ORDER BY REVIEW_SEQ DESC";
		
	static final String SQL_UPDATE_REVIEW_EXPOSURE = "UPDATE Z_REVIEW SET REVIEW_EXPOSURE = ? WHERE REVIEW_SEQ = ?";
	static final String SQL_DELETE_REVIEW = "DELETE FROM Z_REVIEW WHERE REVIEW_SEQ = ?";
	
	static final String SQL_INSERT_REVIEW  = "INSERT INTO Z_REVIEW VALUES(REVIEW_SEQ.nextval,?,?,?,?,?,?,?,sysdate,0)";
	static final String SQL_INSERT_REVIEW2 = "INSERT INTO Z_REVIEW VALUES(REVIEW_SEQ.nextval,NULL,NULL,?,?,?,?,?,sysdate,0)";
	
	static final String SQL_SELECT_DAY_COUNT = "SELECT TO_CHAR(b.dt, 'YYYY-MM-DD') AS REVIEW_DATE\r\n"
			+ "     , NVL(SUM(a.cnt), 0) cnt\r\n"
			+ "  FROM ( SELECT TO_CHAR(REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE\r\n"
			+ "              , COUNT(*) cnt\r\n"
			+ "           FROM Z_REVIEW\r\n"
			+ "          WHERE REVIEW_DATE BETWEEN TO_DATE('2022-06-08', 'YYYY-MM-DD')\r\n"
			+ "                             AND TO_DATE('2022-06-20', 'YYYY-MM-DD')\r\n"
			+ "          GROUP BY REVIEW_DATE\r\n"
			+ "        ) a\r\n"
			+ "      , ( SELECT TO_DATE('2022-06-08', 'YYYY-MM-DD') + LEVEL - 1 AS dt\r\n"
			+ "            FROM dual \r\n"
			+ "         CONNECT BY LEVEL <= (TO_DATE('2022-06-20', 'YYYY-MM-DD') \r\n"
			+ "                            - TO_DATE('2022-06-08', 'YYYY-MM-DD') + 1)\r\n"
			+ "        ) b\r\n"
			+ "  WHERE b.dt = a.REVIEW_DATE(+)\r\n"
			+ "  GROUP BY b.dt\r\n"
			+ "  ORDER BY b.dt";
	
	static final String SQL_SELECT_MemSeq_With_MenuName = "SELECT * FROM Z_REVIEW JOIN Z_MENU USING(MENU_SEQ) WHERE MEM_SEQ = ? ORDER BY REVIEW_SEQ DESC";
	static final String SQL_SELECT_AVG_BY_SHOPSEQ = "SELECT ROUND(SUM(REVIEW_TASTE+REVIEW_AMOUNT+REVIEW_SERVICE)/(COUNT(*)*3),1 ) POINT FROM Z_REVIEW JOIN Z_MENU USING(MENU_SEQ) WHERE SHOP_SEQ = ?"; 
	
	Connection conn;
	Statement st;
	PreparedStatement pst;
	ResultSet rs;
	int result;
	
	
	public String selectMenu(int menu_seq) {
		conn = DBUtil.getConnection();
	
		String menu_name="";
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MenuName);
			pst.setInt(1, menu_seq);
			rs = pst.executeQuery();
			
			 menu_name = rs.getString("menu_name");			
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return menu_name;
	}
	
	
	
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
	public List<ReviewDTO> selectShopReview(int mem_seq)
	{
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{			
			
			pst = conn.prepareStatement(SQL_SELECT_REVIEW_SHOP_MEM);
			pst.setInt(1, mem_seq);
			rs = pst.executeQuery();
			
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
	
	public List<ReviewDTO> selectByDayCount()
	{
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();
		conn = DBUtil.getConnection();
		try
		{
			st = conn.createStatement();
			rs = st.executeQuery(SQL_SELECT_DAY_COUNT);
			
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
			rs = pst.executeQuery();
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
	
	
	/*
	public List<ReviewDTO> selectByMenuSeq(int menu_seq)
	{		
		List<ReviewDTO> reviewDTOs = new ArrayList<>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MenuSeq);
			pst.setInt(1, menu_seq);
			rs = pst.executeQuery();
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
	*/


	public List<ReviewMenuDTO> selectByMenuSeq(int menu_seq)
	{		
		List<ReviewMenuDTO> reviewMenuDTOs = new ArrayList<>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_MenuSeq2);
			pst.setInt(1, menu_seq);
			rs = pst.executeQuery();
			while (rs.next())
			{
				reviewMenuDTOs.add(makeReviewMenu(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewMenuDTOs;
	}	

	
	public List<ReviewShopDTO> selectByShopSeq(int shop_seq)
	{		
		List<ReviewShopDTO> reviewShopDTOs = new ArrayList<>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_ShopSeq);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();
			while (rs.next())
			{
				reviewShopDTOs.add(makeReviewShop(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewShopDTOs;
	}
	
	public List<ReviewShopDTO> selectByShopSeq_Manager(int shop_seq)
	{		
		List<ReviewShopDTO> reviewShopDTOs = new ArrayList<>();
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_ShopSeq_MANAGER);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();
			while (rs.next())
			{
				reviewShopDTOs.add(makeReviewShop(rs));
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return reviewShopDTOs;
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
	
	public int reviewUpdate(ReviewDTO reviewDTO)
	{
		int result = 0;
		
		conn = DBUtil.getConnection();
		
		try
		{
			pst = conn.prepareStatement(SQL_UPDATE_REVIEW_EXPOSURE);			
			pst.setInt(1, reviewDTO.getReview_exposure());
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
	public int reviewDelete(int rewview_seq)
	{
		int result = 0;
		
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_DELETE_REVIEW);			
			pst.setInt(1, rewview_seq);			
			
			
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
	
	
	
	private ReviewMenuDTO makeReviewMenu(ResultSet rs) throws SQLException	
	{
		ReviewMenuDTO reviewMenuDTO = new ReviewMenuDTO();
		
		
		reviewMenuDTO.setMenu_seq(rs.getInt("menu_seq"));		
		reviewMenuDTO.setShop_seq(rs.getInt("shop_seq"));
		reviewMenuDTO.setMenu_category(rs.getString("menu_category"));
		reviewMenuDTO.setMenu_name(rs.getString("menu_name"));
		reviewMenuDTO.setMenu_price(rs.getInt("menu_price"));
		reviewMenuDTO.setMenu_img(rs.getString("menu_img"));
		reviewMenuDTO.setMenu_top(rs.getInt("menu_top"));
		reviewMenuDTO.setMenu_info(rs.getString("menu_info"));
		reviewMenuDTO.setMenu_status(rs.getString("menu_status"));		
		
		
		return reviewMenuDTO;
	}
	private ReviewShopDTO makeReviewShop(ResultSet rs) throws SQLException	
	{
		ReviewShopDTO reviewShopDTO = new ReviewShopDTO();		
	
		reviewShopDTO.setReview_seq(rs.getInt("review_seq"));
		reviewShopDTO.setMem_seq(rs.getInt("mem_seq"));
		reviewShopDTO.setMenu_seq(rs.getInt("menu_seq"));
		reviewShopDTO.setReview_taste(rs.getInt("review_taste"));
		reviewShopDTO.setReview_amount(rs.getInt("review_amount"));
		reviewShopDTO.setReview_service(rs.getInt("review_service"));
		reviewShopDTO.setReview_content(rs.getString("review_content"));
		reviewShopDTO.setReview_img(rs.getString("review_img"));
		reviewShopDTO.setReview_date(rs.getDate("review_date"));
		reviewShopDTO.setReview_exposure(rs.getInt("review_exposure"));	
		
		reviewShopDTO.setShop_seq(rs.getInt("shop_seq"));
		reviewShopDTO.setMenu_category(rs.getString("menu_category"));
		reviewShopDTO.setMenu_name(rs.getString("menu_name"));
		reviewShopDTO.setMenu_price(rs.getInt("menu_price"));
		reviewShopDTO.setMenu_img(rs.getString("menu_img"));
		reviewShopDTO.setMenu_top(rs.getInt("menu_top"));
		reviewShopDTO.setMenu_info(rs.getString("menu_info"));
		reviewShopDTO.setMenu_status(rs.getString("menu_status"));		
		
		
		return reviewShopDTO;
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
	
	public JSONArray selectReviewByMemSeqWithMenuName(int mem_seq) {
		
		JSONArray reviewlist = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_MemSeq_With_MenuName);
			pst.setInt(1, mem_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(reviewlist==null) {
					reviewlist = new JSONArray();
				}
				
				JSONObject review = new JSONObject();
				
				review.put("review_seq", rs.getInt("review_seq"));
				review.put("mem_seq", rs.getInt("mem_seq"));
				review.put("menu_seq", rs.getInt("menu_seq"));
				review.put("review_taste", rs.getInt("review_taste"));
				review.put("review_amount", rs.getInt("review_amount"));
				review.put("review_service", rs.getInt("review_service"));
				review.put("review_content", rs.getString("review_content"));
				review.put("review_img", rs.getString("review_img"));
				review.put("review_date", rs.getDate("review_date"));
				review.put("review_exposure", rs.getString("review_exposure"));
				
				review.put("menu_name", rs.getString("menu_name"));
				
				reviewlist.add(review);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return reviewlist;
		
	}
	
	

	public double selectAvgByShopSeq(int shop_seq)
	{		
		double avg = 0;
		conn = DBUtil.getConnection();
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_AVG_BY_SHOPSEQ);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();
			while (rs.next())
			{
				avg = rs.getDouble("POINT");
			}
		} catch (SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			DBUtil.dbClose(rs, st, conn);
		}
		return avg;
	}	
	
	
	
	
	
	
	
	
	
	/*
	 //수정 백업 
	public List<ReviewDTO> selectByShopSeq(int shop_seq)
	{	
		ResultSetMetaData rsmd = null;
		
		List<ReviewDTO> reviewDTOs = new ArrayList<ReviewDTO>();	
		Map<String, String> reviewShopLists = new HashMap<>();
		
		
		conn = DBUtil.getConnection();
		
		try
		{
			pst = conn.prepareStatement(SQL_SELECT_ShopSeq, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();

			
			 rsmd = rs.getMetaData();
	         

	         // 로우수 구하기
	         rs.last();
	         int row = rs.getRow();
	         rs.beforeFirst();
	         // 컬럼수 구하기
	         int col = rsmd.getColumnCount();
	         System.out.println("결과수: " + row);
	    
	         // 컬럼명 출력
	         for (int i = 1; i <= col; i++) {
	         System.out.printf("%-15s", rsmd.getColumnName(i));         
	         }        	         
	    
	      
	         System.out.println("");
	         // 타입출력
	         for (int i = 1; i <= col; i++) {
	            System.out.printf("%-15s", "("+(rsmd.getColumnTypeName(i))+")");
	         }
	      
	         System.out.println("");
	       
	         // 결과 출력
	         while (rs.next()) {
	            for (int c = 1; c <= col; c++)
	               System.out.printf("%-15s", rs.getString(c));
	            System.out.println("");
	         }

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBUtil.dbClose(rs, st, conn);
	      }
		return reviewDTOs;
	}
	*/
	
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
