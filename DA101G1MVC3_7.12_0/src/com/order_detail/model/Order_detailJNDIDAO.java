package com.order_detail.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Order_detailJNDIDAO implements Order_detailDAO_interface {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
			private static DataSource ds = null;
			static {
				try {
					Context ctx = new InitialContext();
					ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB5");
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
			
			private static final String INSERT_STMT = 
				"INSERT INTO order_detail (order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone) VALUES ('OR'||LPAD(to_char(order_detail_seq.NEXTVAL),5,'0'), ?, ?, ?, ?, CURRENT_TIMESTAMP, ?, ?, ?)";
			private static final String GET_ALL_STMT = 
				"SELECT order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone FROM order_detail order by order_no";
			private static final String GET_ONE_STMT = 
				"SELECT * FROM order_detail where order_no = ?";
			private static final String DELETE = 
				"DELETE FROM order_detail where order_no = ?";
			private static final String UPDATE = 
				"UPDATE order_detail set mem_no=?, merchant_no=?, order_status=?, order_amosum=?, order_cusadr=?, order_cusname=?, order_cusphone=? where order_no = ?";

					
			// 查詢單一廠商有關訂單
			private static final String GET_ONE_ORDER_DETAIL = 
				"SELECT order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone FROM order_detail WHERE order_no IN (SELECT order_no FROM order_list WHERE product_no IN (SELECT product_no FROM product WHERE merchant_no=? )) order by order_no";
			
			
			//更改單一訂單出貨狀態
			private static final String UPDATE_ONE_ORDER_DETAIL_STATUS = 
				"UPDATE order_detail set  order_status=? where order_no = ?";
			
			// 單一廠商查詢全部訂單單一狀態並Order_detailVO傳回list
			private static final String GET_OLNYSTATUS_ONE_ORDER_DETAIL = 
				"SELECT order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone FROM order_detail WHERE order_status=? AND order_no IN (SELECT order_no FROM order_list WHERE product_no IN (SELECT product_no FROM product WHERE merchant_no=? )) order by order_no";
				
			
			// 管理員查詢一個月單一廠商已出貨全部訂單
			private static final String GET_MONTH_MERCHANT =
				"SELECT order_no,mem_no,merchant_no,order_status,order_amosum,order_time,order_cusadr,order_cusname,order_cusphone FROM order_detail WHERE  (order_status='O2' AND to_char(order_time,'mm')= ? )  AND order_no IN (SELECT order_no FROM order_list WHERE product_no IN (SELECT product_no FROM product WHERE merchant_no=? )) order by order_no";
			
			
			// 管理員查詢一個月單一廠商已出貨全部訂單總金額
			private static final String GET_ONE_MONTH_MANEY = 
				"SELECT SUM(order_amosum) FROM order_detail WHERE  (order_status='O2' AND to_char(order_time,'mm')= ? )  AND order_no IN (SELECT order_no FROM order_list WHERE product_no IN (SELECT product_no FROM product WHERE merchant_no=? )) order by order_no";
				
			
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
					// Handle any SQL errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
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

			}
			
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
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
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

			}
			
			public void delete(String order_no) {
				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(DELETE);

					pstmt.setString(1, order_no);

					pstmt.executeUpdate();
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
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

			}
			
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
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
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
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
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
			
			
			//查詢單一廠商有關訂單
			public List<Order_detailVO> findOrder_detailByMerchantNo(String merchant_no) {
				List<Order_detailVO> list = new ArrayList<Order_detailVO>();
				Order_detailVO order_detailVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(GET_ONE_ORDER_DETAIL);
					
					pstmt.setString(1, merchant_no);
					
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
					// Handle any driver errors
			    } catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
								+ se.getMessage());
					// Clean up JDBC resources
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
					   }catch (Exception e) {
						e.printStackTrace(System.err);
					   }
					}
				}
				return list;
			};
			
			//更改單一訂單出貨狀態
			public void updateOrder_detailStatus(Order_detailVO order_detailVO){
				Connection con = null;
				PreparedStatement pstmt = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(UPDATE_ONE_ORDER_DETAIL_STATUS);

					pstmt.setString(1, order_detailVO.getOrder_status());
				
					pstmt.setString(2, order_detailVO.getOrder_no());

					pstmt.executeUpdate();
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
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

			}
			
			
			// 單一廠商查詢全部訂單單一狀態並Order_detailVO傳回list
			public List<Order_detailVO> getOneStatusOrder_detailByMerchantNo(String order_status,String merchant_no) {
				List<Order_detailVO> list = new ArrayList<Order_detailVO>();
				Order_detailVO order_detailVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(GET_OLNYSTATUS_ONE_ORDER_DETAIL);
					
					pstmt.setString(1, order_status);
					pstmt.setString(2, merchant_no);
					
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
					// Handle any driver errors
			    } catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
								+ se.getMessage());
					// Clean up JDBC resources
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
					   }catch (Exception e) {
						e.printStackTrace(System.err);
					   }
					}
				}
				return list;
			};
			
			
			
			// 管理員查詢一個月單一廠商已出貨全部訂單
			public List<Order_detailVO> getOneMonthOfOneMerchantNo (String month,String merchant_no) {
				List<Order_detailVO> list = new ArrayList<Order_detailVO>();
				Order_detailVO order_detailVO = null;

				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(GET_MONTH_MERCHANT);
					
					pstmt.setString(1, month); //只要月份
					pstmt.setString(2, merchant_no);
					
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
					// Handle any driver errors
			    } catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
								+ se.getMessage());
					// Clean up JDBC resources
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
					   }catch (Exception e) {
						e.printStackTrace(System.err);
					   }
					}
				}
				return list;
			};
			
			
			
			
			// 管理員查詢一個月單一廠商已出貨全部訂單總金額
			public Order_detailVO getOneMonthOfMerchant(String month,String merchant_no) {

				Order_detailVO order_detailVO = null;
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {

					con = ds.getConnection();
					pstmt = con.prepareStatement(GET_ONE_MONTH_MANEY);

					pstmt.setString(1, month);
					pstmt.setString(2, merchant_no);

					rs = pstmt.executeQuery();

					while (rs.next()) {

						order_detailVO = new Order_detailVO();
						order_detailVO.setOrder_amosum(rs.getInt("SUM(order_amosum)"));
					}
					// Handle any driver errors
				} catch (SQLException se) {
					throw new RuntimeException("A database error occured. "
							+ se.getMessage());
					// Clean up JDBC resources
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
		

}
