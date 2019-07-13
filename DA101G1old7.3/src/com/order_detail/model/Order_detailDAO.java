package com.order_detail.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Order_detailDAO implements Order_detailDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB4");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO order_detail (order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone) VALUES ('OR'||LPAD(to_char(order_detail_seq.NEXTVAL),5,'0'), ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?)";
	private static final String GET_ALL_STMT = "SELECT order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone FROM order_detail order by order_no";
	private static final String GET_ONE_STMT = "SELECT * FROM order_detail where order_no = ?";
	private static final String DELETE = "DELETE FROM order_detail where order_no = ?";
	private static final String UPDATE = "UPDATE order_detail set mem_no=?, merchant_no=?, order_status=?, order_amosum=?, order_cusadr=?, order_cusname=?, order_cusphone=? where order_no = ?";

	public void insert(Order_detailVO order_detailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, order_detailVO.getMem_no());
			pstmt.setString(2, order_detailVO.getMerchant_no());
			pstmt.setString(3, order_detailVO.getOrder_status());
			pstmt.setInt(4, order_detailVO.getOrder_amosum());
			pstmt.setString(5, order_detailVO.getOrder_cusadr());
			pstmt.setString(6, order_detailVO.getOrder_cusname());
			pstmt.setString(7, order_detailVO.getOrder_cusphone());
			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	};

	public void update(Order_detailVO order_detailVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, order_detailVO.getMem_no());
			pstmt.setString(2, order_detailVO.getMerchant_no());
			pstmt.setString(3, order_detailVO.getOrder_status());
			pstmt.setInt(4, order_detailVO.getOrder_amosum());
			pstmt.setString(5, order_detailVO.getOrder_cusadr());
			pstmt.setString(6, order_detailVO.getOrder_cusname());
			pstmt.setString(7, order_detailVO.getOrder_cusphone());
			pstmt.setString(8, order_detailVO.getOrder_no());

			pstmt.executeUpdate();

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	};

	public void delete(String order_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, order_no);

			pstmt.executeUpdate();

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	};

	public Order_detailVO findByPrimaryKey(String order_no) {

		Order_detailVO order_detailVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, order_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				order_detailVO = new Order_detailVO();
				order_detailVO.setOrder_no(rs.getString("order_no"));
				order_detailVO.setMem_no(rs.getString("mem_no"));
				order_detailVO.setMerchant_no(rs.getString("merchant_no"));
				order_detailVO.setOrder_status(rs.getString("order_status"));
				order_detailVO.setOrder_amosum(rs.getInt("order_amosum"));
				order_detailVO.setOrder_time(rs.getTimestamp("order_time"));
				order_detailVO.setOrder_cusadr(rs.getString("order_cusadr"));
				order_detailVO.setOrder_cusname(rs.getString("order_cusname"));
				order_detailVO.setOrder_cusphone(rs.getString("order_cusphone"));
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return order_detailVO;
	}

	public List<Order_detailVO> getAll() {
		List<Order_detailVO> list = new ArrayList<Order_detailVO>();
		Order_detailVO order_detailVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				order_detailVO = new Order_detailVO();
				order_detailVO.setOrder_no(rs.getString("order_no"));
				order_detailVO.setMem_no(rs.getString("mem_no"));
				order_detailVO.setMerchant_no(rs.getString("merchant_no"));
				order_detailVO.setOrder_status(rs.getString("order_status"));
				order_detailVO.setOrder_amosum(rs.getInt("order_amosum"));
				order_detailVO.setOrder_time(rs.getTimestamp("order_time"));
				order_detailVO.setOrder_cusadr(rs.getString("order_cusadr"));
				order_detailVO.setOrder_cusname(rs.getString("order_cusname"));
				order_detailVO.setOrder_cusphone(rs.getString("order_cusphone"));
				list.add(order_detailVO);
			}

		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());

		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	};
}
