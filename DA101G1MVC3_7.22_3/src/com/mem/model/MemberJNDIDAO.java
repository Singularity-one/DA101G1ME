package com.mem.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.merchant.model.MerchantVO;

public class MemberJNDIDAO implements MemberDAO_interface {
	
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
			private static DataSource ds = null;
			static {
				try {
					Context ctx = new InitialContext();
					ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
	
			
		//查詢一個會員點數
		private static final String GET_ONE_MEM_AMO = 
			"SELECT mem_no,mem_amo FROM Mem where mem_no = ?";
				
		//修改會員點數
		private static final String UPDATE_MEM_AMO = 
			"UPDATE mem set mem_amo= ? where mem_no = ?";
			
	
	

	@Override
	public void insert(MemberVO MemberVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(MemberVO MemberVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update2(MemberVO MemberVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String mem_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO findByPrimaryKey(String mem_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findMem_email(String mem_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberVO> getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
		//查詢單一會員點數
	@Override
	public MemberVO findMenAmoByMenNo(String mem_no) {
		
		MemberVO memberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_MEM_AMO);

			pstmt.setString(1, mem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				memberVO = new MemberVO();
				memberVO.setMem_no(rs.getString("mem_no"));
				memberVO.setMem_amo(rs.getInt("mem_amo"));
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
		return memberVO;
	}

	//更改會員點數
	@Override
	public void updateAboutMenAmo(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE_MEM_AMO);
			
			pstmt.setInt(1, memberVO.getMem_amo());
			pstmt.setString(2, memberVO.getMem_no());

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

}
