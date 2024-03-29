package com.zumuniyo.orderlist.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.orderlist.dto.OrderlistDTO;
import com.zumuniyo.util.DBUtil;

public class OrderlistDAO {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	static final String SQL_SELECT_ALL = "SELECT * FROM Z_ORDERLIST ORDER BY 1 DESC";
	static final String SQL_SELECT_NEXT_GROUP_SEQ = "SELECT ORDER_GROUP_SEQ.NEXTVAL FROM dual";
	// 오더그룹/샵번호/메뉴번호/수량/테이블번호/맴버번호:비회원은널(db): 반환은 -1
	static final String SQL_INSERT = "INSERT INTO Z_ORDERLIST VALUES (ORDER_SEQ.NEXTVAL,?,?,?,?,?,?,sysdate,'주문대기')";
	static final String SQL_SELECT_BY_MEM_SEQ = "SELECT * FROM Z_ORDERLIST WHERE MEM_SEQ=? ORDER BY 1 DESC";
	static final String SQL_SELECT_BY_SHOP_SEQ = "SELECT * FROM Z_ORDERLIST WHERE SHOP_SEQ=? ORDER BY 1 DESC";
	static final String SQL_SELECT_BY_ORDER_GROUP_SEQ = "SELECT * FROM Z_ORDERLIST WHERE ORDER_GROUP_SEQ=? ORDER BY 1 DESC";
	static final String SQL_SELECT_BY_ORDER_GROUP_SEQ_WITH_MENU_AND_SHOP = "SELECT ORDER_GROUP,MENU_NAME,MENU_PRICE,ORDER_COUNT,ORDER_TABLENUM,ORDER_DATE,ORDER_STATUS,MENU_CATEGORY,MENU_IMG,SHOP_NAME FROM Z_ORDERLIST JOIN Z_MENU USING(MENU_SEQ,SHOP_SEQ) JOIN Z_SHOP USING(SHOP_SEQ) WHERE ORDER_GROUP=? ORDER BY 1";
	static final String SQL_SELECT_BY_MEM_SEQ_WITH_MENU_AND_SHOP = "SELECT ORDER_GROUP,MENU_NAME,MENU_PRICE,ORDER_COUNT,ORDER_TABLENUM,ORDER_DATE,ORDER_STATUS,MENU_CATEGORY,MENU_IMG,SHOP_NAME,MENU_SEQ FROM Z_ORDERLIST JOIN Z_MENU USING(MENU_SEQ,SHOP_SEQ) JOIN Z_SHOP USING(SHOP_SEQ) WHERE Z_ORDERLIST.MEM_SEQ=? ORDER BY ORDER_GROUP DESC";
	static final String SQL_SELECT_BY_SHOP_SEQ_WITH_MENU_AND_SHOP = "SELECT ORDER_GROUP,MENU_NAME,MENU_PRICE,ORDER_COUNT,ORDER_TABLENUM,ORDER_DATE,ORDER_STATUS,MENU_CATEGORY,MENU_IMG,SHOP_NAME,MENU_SEQ,CNT,TOTAL"+
			" FROM Z_ORDERLIST JOIN Z_MENU USING(MENU_SEQ,SHOP_SEQ) JOIN Z_SHOP USING(SHOP_SEQ) JOIN (SELECT ORDER_GROUP,COUNT(ORDER_GROUP) CNT,SUM(MENU_PRICE*ORDER_COUNT) TOTAL FROM Z_ORDERLIST JOIN Z_MENU USING(MENU_SEQ,SHOP_SEQ) GROUP BY ORDER_GROUP) USING (ORDER_GROUP)"+
			" WHERE SHOP_SEQ=? AND ORDER_STATUS<>'결제완료' ORDER BY ORDER_GROUP DESC";
	
	static final String SQL_UPDATE_ORDER_STATUS_BY_ORDER_GROUP = "UPDATE Z_ORDERLIST SET ORDER_STATUS = ? WHERE ORDER_GROUP = ?";
	
	public OrderlistDTO makeOrder(ResultSet rs) throws SQLException {

		OrderlistDTO order = new OrderlistDTO();

		order.setOrder_seq(rs.getInt("ORDER_SEQ"));
		order.setOrder_group(rs.getInt("ORDER_GROUP"));
		order.setShop_seq(rs.getInt("SHOP_SEQ"));
		order.setMenu_seq(rs.getInt("MENU_SEQ"));
		order.setOrder_count(rs.getInt("ORDER_COUNT"));
		order.setOrder_tablenum(rs.getInt("ORDER_TABLENUM"));
		order.setMem_seq(rs.getString("MEM_SEQ")!=null?rs.getInt("MEM_SEQ"):-1);
		order.setOrder_date(rs.getDate("ORDER_DATE"));
		order.setOrder_status(rs.getString("ORDER_STATUS"));
		
		return order;
	}

	public List<OrderlistDTO> selectAll() {

		List<OrderlistDTO> orderlist = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_ALL);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new ArrayList<OrderlistDTO>();
				}
				orderlist.add(makeOrder(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
	}
	
	public int selectNextOrderGroupSeq() {

		int next=-1;
		
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_NEXT_GROUP_SEQ);
			rs = pst.executeQuery();
			while(rs.next()) {
				next=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return next;
	}

	public int insertOrder(OrderlistDTO order) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_INSERT);
			// 오더그룹/샵번호/메뉴번호/수량/테이블번호/맴버번호:비회원은널(db): 반환은 -1
			pst.setInt(1, order.getOrder_group());
			pst.setInt(2, order.getShop_seq());
			pst.setInt(3, order.getMenu_seq());
			pst.setInt(4, order.getOrder_count());
			pst.setInt(5, order.getOrder_tablenum());
			if(order.getMem_seq()==-1) {
				pst.setNull(6, Types.INTEGER);
			}else {
				pst.setInt(6, order.getMem_seq());
			}
			
			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
	}

	public List<OrderlistDTO> selectByMemSeq(int mem_seq) {

		List<OrderlistDTO> orderlist = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_MEM_SEQ);
			pst.setInt(1, mem_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new ArrayList<OrderlistDTO>();
				}
				orderlist.add(makeOrder(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
	}
	
	public List<OrderlistDTO> selectByShopSeq(int shop_seq) {

		List<OrderlistDTO> orderlist = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_SHOP_SEQ);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new ArrayList<OrderlistDTO>();
				}
				orderlist.add(makeOrder(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
		
	}
	
	public List<OrderlistDTO> selectByOrderGroupSeq(int order_group_seq) {

		List<OrderlistDTO> orderlist = null;
		conn = DBUtil.getConnection();

		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ORDER_GROUP_SEQ);
			pst.setInt(1, order_group_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new ArrayList<OrderlistDTO>();
				}
				orderlist.add(makeOrder(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
		
	}
	
	public JSONArray selectByOrderGroupSeqWithMenuAndShop(int order_group_seq) {
		
		JSONArray orderlist = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_ORDER_GROUP_SEQ_WITH_MENU_AND_SHOP);
			pst.setInt(1, order_group_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new JSONArray();
				}
				
				JSONObject order = new JSONObject();
				
				order.put("ORDER_GROUP", rs.getInt("ORDER_GROUP"));
				order.put("MENU_NAME", rs.getString("MENU_NAME"));
				order.put("MENU_PRICE", rs.getInt("MENU_PRICE"));
				order.put("ORDER_COUNT", rs.getInt("ORDER_COUNT"));
				order.put("ORDER_TABLENUM", rs.getInt("ORDER_TABLENUM"));
				order.put("ORDER_DATE", rs.getDate("ORDER_DATE"));
				order.put("ORDER_STATUS", rs.getString("ORDER_STATUS"));
				order.put("MENU_CATEGORY", rs.getString("MENU_CATEGORY"));
				order.put("MENU_IMG", rs.getString("MENU_IMG"));
				order.put("SHOP_NAME", rs.getString("SHOP_NAME"));
				
				orderlist.add(order);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
		
	}
	
	public JSONArray selectByMemSeqWithMenuAndShop(int mem_seq) {
		
		JSONArray orderlist = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_MEM_SEQ_WITH_MENU_AND_SHOP);
			pst.setInt(1, mem_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new JSONArray();
				}
				
				JSONObject order = new JSONObject();
				
				order.put("ORDER_GROUP", rs.getInt("ORDER_GROUP"));
				order.put("MENU_NAME", rs.getString("MENU_NAME"));
				order.put("MENU_PRICE", rs.getInt("MENU_PRICE"));
				order.put("ORDER_COUNT", rs.getInt("ORDER_COUNT"));
				order.put("ORDER_TABLENUM", rs.getInt("ORDER_TABLENUM"));
				order.put("MENU_SEQ", rs.getInt("MENU_SEQ"));
				order.put("ORDER_DATE", rs.getDate("ORDER_DATE"));
				order.put("ORDER_STATUS", rs.getString("ORDER_STATUS"));
				order.put("MENU_CATEGORY", rs.getString("MENU_CATEGORY"));
				order.put("MENU_IMG", rs.getString("MENU_IMG"));
				order.put("SHOP_NAME", rs.getString("SHOP_NAME"));
				
				orderlist.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
		
	}
	public JSONArray selectByShopSeqWithMenuAndShop(int shop_seq) {
		
		JSONArray orderlist = null;
		conn = DBUtil.getConnection();
		
		try {
			pst = conn.prepareStatement(SQL_SELECT_BY_SHOP_SEQ_WITH_MENU_AND_SHOP);
			pst.setInt(1, shop_seq);
			rs = pst.executeQuery();
			while(rs.next()) {
				if(orderlist==null) {
					orderlist = new JSONArray();
				}
				
				JSONObject order = new JSONObject();
				
				order.put("ORDER_GROUP", rs.getInt("ORDER_GROUP"));
				order.put("MENU_NAME", rs.getString("MENU_NAME"));
				order.put("MENU_PRICE", rs.getInt("MENU_PRICE"));
				order.put("ORDER_COUNT", rs.getInt("ORDER_COUNT"));
				order.put("ORDER_TABLENUM", rs.getInt("ORDER_TABLENUM"));
				order.put("MENU_SEQ", rs.getInt("MENU_SEQ"));
				order.put("ORDER_DATE", new SimpleDateFormat("yy.MM.dd HH:mm:ss").format(rs.getDate("ORDER_DATE")));
				order.put("ORDER_STATUS", rs.getString("ORDER_STATUS"));
				order.put("MENU_CATEGORY", rs.getString("MENU_CATEGORY"));
				order.put("MENU_IMG", rs.getString("MENU_IMG"));
				order.put("SHOP_NAME", rs.getString("SHOP_NAME"));
				order.put("CNT", rs.getInt("CNT"));
				order.put("TOTAL", rs.getInt("TOTAL"));
				orderlist.add(order);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return orderlist;
		
	}
	
	public int updateStatusBygroup(String order_status,int order_group) {

		int result = 0;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_UPDATE_ORDER_STATUS_BY_ORDER_GROUP);
			pst.setString(1, order_status);
			pst.setInt(2, order_group);

			result = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, pst, conn);
		}
		return result;
		
	}
	

	
	
	
	
	
	
	
	
}
