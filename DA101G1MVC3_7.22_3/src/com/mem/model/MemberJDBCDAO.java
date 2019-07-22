package com.mem.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.merchant.model.MerchantVO;

public class MemberJDBCDAO implements MemberDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "DA101G1MER";
	String passwd = "123456";

	private static final String INSERT_STMT = 
			"INSERT INTO Mem (Mem_no,Mem_id,Mem_psw,Mem_name,Mem_nickname,Mem_adrs,Mem_tel,Mem_email,Mem_pic) VALUES ('MB'||LPAD(to_char(MEM_seq.NEXTVAL),5 ,'0'), ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
			"SELECT * FROM Mem order by Mem_no";
	private static final String GET_ONE_STMT = 
			"SELECT * FROM Mem where Mem_no = ?";
	private static final String GET_ID = 
			"SELECT * FROM Mem where Mem_id = ?";
	private static final String DELETE = 
			"DELETE FROM Mem where Mem_no = ?";
	private static final String UPDATE = 
			"UPDATE Mem set Mem_id=?, Mem_psw=?, Mem_name=?, Mem_adrs=?, Mem_tel=?, Mem_email=?, Mem_status=?, Mem_nickname=?, game_nickname=?, Mem_amo=? where Mem_no = ?";
	private static final String UPDATE2 = 
			"UPDATE Mem set Mem_email=?, Mem_psw=?, Mem_name=?, Mem_nickname=?, Mem_adrs=?, Mem_tel=?, Mem_status=? where Mem_no = ?";
	
	
	//查詢一個會員點數
	private static final String GET_ONE_MEM_AMO = 
			"SELECT mem_no,mem_amo FROM Mem where mem_no = ?";
	
	//修改會員點數
	private static final String UPDATE_MEM_AMO = 
			"UPDATE mem set mem_amo= ? where mem_no = ?";
	
	@Override
	public void insert(MemberVO MemberVO) {

	}

	@Override
	public void update(MemberVO MemberVO) {

		
	}
	
	
	@Override
	public void update2(MemberVO memberVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE2);
			pstmt.setString(1, memberVO.getMem_email());
			pstmt.setString(2, memberVO.getMem_psw());
			pstmt.setString(3, memberVO.getMem_name());
			pstmt.setString(4, memberVO.getMem_nickname());
//			pstmt.setDate(5, memberVO.getMem_birthday());
			pstmt.setString(5, memberVO.getMem_adrs());
			pstmt.setString(6, memberVO.getMem_tel());
			pstmt.setString(7, memberVO.getMem_status());
			pstmt.setString(8, memberVO.getMem_no());
//			pstmt.setInt(9, MemberVO.getMem_amo());
			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		}catch (SQLException se) {
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
	}
	
	@Override
	public void delete(String mem_no) {

	}


	@Override
	public MemberVO findByPrimaryKey(String mem_no) {

		MemberVO MemberVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, mem_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// MemberVO Domain objects
				
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
		return MemberVO;
	}

	@Override
	public List<MemberVO> getAll() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO MemberVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// MemberVO Domain objects
				
				list.add(MemberVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
	}
	
	
	@Override
	public MemberVO findMem_email(String mem_email) {
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

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_MEM_AMO);

			pstmt.setString(1, mem_no);

			rs = pstmt.executeQuery();


				while (rs.next()) {
					// empVo 也稱為 Domain objects
					memberVO = new MemberVO();
					memberVO.setMem_no(rs.getString("mem_no"));
					memberVO.setMem_amo(rs.getInt("mem_amo"));
					
				}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_MEM_AMO);

			pstmt.setInt(1, memberVO.getMem_amo());
			pstmt.setString(2, memberVO.getMem_no());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		}catch (SQLException se) {
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
	}
	
	
	
	
	
	
	

	public static void main(String[] args) {

		MemberJDBCDAO dao = new MemberJDBCDAO();

//		//新增
//		MemberVO MemberVO1 = new MemberVO();
////		MemberVO1.setMem_no("");
//		MemberVO1.setMem_id("MANAGER");
//		MemberVO1.setMem_psw("MANAGER");
//		MemberVO1.setMem_name("巨神兵");
//		MemberVO1.setMem_adrs("台中市西區向上北路100號");
//		MemberVO1.setMem_tel("0988168168");
//		MemberVO1.setMem_email("MANAGER@gmail.com");
//		MemberVO1.setMem_status("M2");
//		MemberVO1.setMem_nickname("巨");
//		MemberVO1.setGame_nickname("神兵");
//		MemberVO1.setMem_amo(3000);
////		MemberVO1.setMem_pic("");
//		dao.insert(MemberVO1);
//
		//修改
//		MemberVO MemberVO2 = new MemberVO();
//		MemberVO2.setMem_no("MB00006");
//		MemberVO2.setMem_name("MisJ6666");
//		MemberVO2.setMem_id("MisJ2");
//		MemberVO2.setMem_psw("MisJ2");
//		MemberVO2.setMem_adrs("MisJ2");
//		MemberVO2.setDate(java.sql.Date(2008/02/25));
//		MemberVO2.setMem_tel("MisJ2");
//		MemberVO2.setMem_email("MisJ2@gmail.com");
//		MemberVO2.setMem_status("M3");
//		MemberVO2.setMem_nickname("MisJ2");
//		MemberVO2.setGame_nickname("MisJ2");
//		MemberVO2.setMem_amo(666);
//		dao.update2(MemberVO2);
		

//
//		//刪除
//		dao.delete("MB00001");
//
//		// PK查詢
//		MemberVO MemberVO3 = dao.findByPrimaryKey("MB00001");
//		System.out.print(MemberVO3.getMem_no() + ",");
////		System.out.print(MemberVO3.getMem_id() + ",");
//		System.out.print(MemberVO3.getMem_psw() + ",");
//		System.out.print(MemberVO3.getMem_name() + ",");
//		System.out.print(MemberVO3.getMem_adrs() + ",");
//		System.out.print(MemberVO3.getMem_tel() + ",");
//		System.out.print(MemberVO3.getMem_email() + ",");
//		System.out.print(MemberVO3.getMem_status() + ",");
//		System.out.print(MemberVO3.getMem_nickname() + ",");
////		System.out.print(MemberVO3.getGame_nickname() + ",");
//		System.out.print(MemberVO3.getMem_amo() + ",");
//		System.out.println(MemberVO3.getMem_pic() + ",");
//		System.out.println("---------------------");

		
//		// id查詢
//		MemberVO MemberVO4 = dao.findID("qwerty");
//		System.out.print(MemberVO4.getMem_no() + ",");
//		System.out.print(MemberVO4.getMem_id() + ",");
//		System.out.print(MemberVO4.getMem_psw() + ",");
//		System.out.print(MemberVO4.getMem_name() + ",");
//		System.out.print(MemberVO4.getMem_adrs() + ",");
//		System.out.print(MemberVO4.getMem_tel() + ",");
//		System.out.print(MemberVO4.getMem_email() + ",");
//		System.out.print(MemberVO4.getMem_status() + ",");
//		System.out.print(MemberVO4.getMem_nickname() + ",");
//		System.out.print(MemberVO4.getGame_nickname() + ",");
//		System.out.print(MemberVO4.getMem_amo() + ",");
//		System.out.println(MemberVO4.getMem_pic() + ",");
//		System.out.println("---------------------");
//		
		// 全部查詢
//		List<MemberVO> list = dao.getAll();
//		for (MemberVO aMember : list) {
//			System.out.print(aMember.getMem_no() + ",");
//			System.out.print(aMember.getMem_id() + ",");
//			System.out.print(aMember.getMem_psw() + ",");
//			System.out.print(aMember.getMem_name() + ",");
//			System.out.print(aMember.getMem_adrs() + ",");
//			System.out.print(aMember.getMem_tel() + ",");
//			System.out.print(aMember.getMem_email() + ",");
//			System.out.print(aMember.getMem_status() + ",");
//			System.out.print(aMember.getMem_nickname() + ",");
//			System.out.print(aMember.getGame_nickname() + ",");
//			System.out.print(aMember.getMem_amo() + ",");
//			System.out.println(aMember.getMem_pic());
//			System.out.println("---------------------");
//		}
		
		
		// 查詢會員點數
		MemberVO MemberVO3 = dao.findMenAmoByMenNo("MB00006");
		System.out.print(MemberVO3.getMem_no() + ",");
		System.out.print(MemberVO3.getMem_amo() + ",");
		System.out.println("---------------------");
		
		
		
		//修改點數
//		MemberVO MemberVO2 = new MemberVO();
//		MemberVO2.setMem_no("MB00006");
//		MemberVO2.setMem_amo(1000);
//		dao.updateAboutMenAmo(MemberVO2);
		
		
		
		
	}

	
}
