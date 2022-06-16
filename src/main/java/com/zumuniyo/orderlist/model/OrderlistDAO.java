package com.zumuniyo.orderlist.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

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

	//static final String SQL_UPDATE_BY_SEQ = "UPDATE Z_MEMBER SET";
	
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
			pst = conn.prepareStatement(SQL_SELECT_ALL);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
}
