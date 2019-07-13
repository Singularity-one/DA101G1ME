package com.product.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductJDBCDAO implements ProductDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "WILLIE";
	String passwd = "123456";

	private static final String INSERT_STMT = 
		"INSERT INTO product (product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan) VALUES ('PR'||LPAD(to_char(product_seq.NEXTVAL),5,'0'), ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String GET_ALL_STMT = 
		"SELECT product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan FROM product order by product_no";
	private static final String GET_ONE_STMT = 
		"SELECT product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan FROM product where product_no = ?";
	private static final String DELETE = 
		"DELETE FROM product where product_no = ?";
	private static final String UPDATE = 
		"UPDATE product set merchant_no=?, product_name=?, product_status=?, product_pr=?, product_typ=?, product_pn=?, product_ps=?, product_img=?, product_quan=? where product_no = ?";

	// 查詢單一廠商有關商品
	private static final String GET_ONE_MERCHANT = 
		"SELECT product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan FROM product where merchant_no = ?";
			
	//更改單一商品上下架狀態
	private static final String UPDATE_ONE_PRODUCT_STATUS = 
		"UPDATE product set  product_status=? where product_no = ?";
	
	//查詢單一上下架狀態傳回商品list
	private static final String GET_ONE_STATUS_PRODUCT = 
		"SELECT product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan FROM product where product_status = ?";
						
	//查詢上下架狀態和廣告狀態傳回商品list
	private static final String GET_TWO_STATUS_PRODUCT = 
		"SELECT product_no,merchant_no,product_name,product_status,product_pr,product_typ,product_pn,product_ps,product_img,product_quan FROM product where product_status = ? AND product_pn= ? ";
		
	
	@Override
	public void insert(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, productVO.getMerchant_no());
			pstmt.setString(2, productVO.getProduct_name());
			pstmt.setString(3, productVO.getProduct_status());
			pstmt.setInt(4, productVO.getProduct_pr());
			pstmt.setString(5, productVO.getProduct_typ());
			pstmt.setString(6, productVO.getProduct_pn());
			pstmt.setString(7, productVO.getProduct_ps());
			pstmt.setBytes(8, productVO.getProduct_img());
			pstmt.setInt(9, productVO.getProduct_quan());
			
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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

	
	@Override
	public void update(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, productVO.getMerchant_no());
			pstmt.setString(2, productVO.getProduct_name());
			pstmt.setString(3, productVO.getProduct_status());
			pstmt.setInt(4, productVO.getProduct_pr());
			pstmt.setString(5, productVO.getProduct_typ());
			pstmt.setString(6, productVO.getProduct_pn());
			pstmt.setString(7, productVO.getProduct_ps());
			pstmt.setBytes(8, productVO.getProduct_img());
			pstmt.setInt(9, productVO.getProduct_quan());
			pstmt.setString(10, productVO.getProduct_no());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	
	
	@Override
	public void delete(String product_no) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, product_no);

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	
	
	@Override
	public ProductVO findByPrimaryKey(String product_no) {
		

		ProductVO productVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, product_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setProduct_no(rs.getString("product_no"));
				productVO.setMerchant_no(rs.getString("merchant_no"));
				productVO.setProduct_name(rs.getString("product_name"));
				productVO.setProduct_status(rs.getString("product_status"));
				productVO.setProduct_pr(rs.getInt("product_pr"));
				productVO.setProduct_typ(rs.getString("product_typ"));
				productVO.setProduct_pn(rs.getString("product_pn"));
				productVO.setProduct_ps(rs.getString("product_ps"));
				productVO.setProduct_img(rs.getBytes("product_img"));
				productVO.setProduct_quan(rs.getInt("product_quan"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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
		return productVO;
	}

	
	@Override
	public List<ProductVO> getAll() {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setProduct_no(rs.getString("product_no"));
				productVO.setMerchant_no(rs.getString("merchant_no"));
				productVO.setProduct_name(rs.getString("product_name"));
				productVO.setProduct_status(rs.getString("product_status"));
				productVO.setProduct_pr(rs.getInt("product_pr"));
				productVO.setProduct_typ(rs.getString("product_typ"));
				productVO.setProduct_pn(rs.getString("product_pn"));
				productVO.setProduct_ps(rs.getString("product_ps"));
				productVO.setProduct_img(rs.getBytes("product_img"));
				productVO.setProduct_img(rs.getBytes("product_quan"));
				list.add(productVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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
	
	// 查詢單一廠商有關商品
	@Override
	public List<ProductVO> findByMerchantNo(String merchant_no) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_MERCHANT);
			
			pstmt.setString(1, merchant_no);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setProduct_no(rs.getString("product_no"));
				productVO.setMerchant_no(rs.getString("merchant_no"));
				productVO.setProduct_name(rs.getString("product_name"));
				productVO.setProduct_status(rs.getString("product_status"));
				productVO.setProduct_pr(rs.getInt("product_pr"));
				productVO.setProduct_typ(rs.getString("product_typ"));
				productVO.setProduct_pn(rs.getString("product_pn"));
				productVO.setProduct_ps(rs.getString("product_ps"));
				productVO.setProduct_img(rs.getBytes("product_img"));
				productVO.setProduct_img(rs.getBytes("product_quan"));
				list.add(productVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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
	
	
	// 更改用單一商品編號更改上下架狀態並ProductVO傳回
	@Override
	public void updateProductStatus(ProductVO productVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE_ONE_PRODUCT_STATUS);


			pstmt.setString(1, productVO.getProduct_status());

			pstmt.setString(2, productVO.getProduct_no());

			pstmt.executeUpdate();

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
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
	
	
	
	//查詢單一上下架狀態傳回商品
	@Override
	public List<ProductVO>  getOneStatusOfAll(String product_status) {
		List<ProductVO> list = new ArrayList<ProductVO>();
		ProductVO productVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STATUS_PRODUCT);
			
			pstmt.setString(1, product_status);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {

				productVO = new ProductVO();
				productVO.setProduct_no(rs.getString("product_no"));
				productVO.setMerchant_no(rs.getString("merchant_no"));
				productVO.setProduct_name(rs.getString("product_name"));
				productVO.setProduct_status(rs.getString("product_status"));
				productVO.setProduct_pr(rs.getInt("product_pr"));
				productVO.setProduct_typ(rs.getString("product_typ"));
				productVO.setProduct_pn(rs.getString("product_pn"));
				productVO.setProduct_ps(rs.getString("product_ps"));
				productVO.setProduct_img(rs.getBytes("product_img"));
				productVO.setProduct_img(rs.getBytes("product_quan"));
				list.add(productVO);
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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
	
	
	
	//查詢上下架狀態和廣告狀態傳回商品list
	@Override
	public List<ProductVO>  getOneStatusOfAll(String product_status,String product_pn) {
			List<ProductVO> list = new ArrayList<ProductVO>();
			ProductVO productVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				Class.forName(driver);
				con = DriverManager.getConnection(url, userid, passwd);
				pstmt = con.prepareStatement(GET_TWO_STATUS_PRODUCT);
				
				pstmt.setString(1, product_status);
				pstmt.setString(2, product_pn);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {

					productVO = new ProductVO();
					productVO.setProduct_no(rs.getString("product_no"));
					productVO.setMerchant_no(rs.getString("merchant_no"));
					productVO.setProduct_name(rs.getString("product_name"));
					productVO.setProduct_status(rs.getString("product_status"));
					productVO.setProduct_pr(rs.getInt("product_pr"));
					productVO.setProduct_typ(rs.getString("product_typ"));
					productVO.setProduct_pn(rs.getString("product_pn"));
					productVO.setProduct_ps(rs.getString("product_ps"));
					productVO.setProduct_img(rs.getBytes("product_img"));
					productVO.setProduct_img(rs.getBytes("product_quan"));
					list.add(productVO);
				}

			} catch (ClassNotFoundException e) {
				throw new RuntimeException("Couldn't load database driver. " + e.getMessage());

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
	

	public static void main(String[] args) {

		ProductJDBCDAO dao = new ProductJDBCDAO();

		// 新增
//    	ProductVO productVO1 = new ProductVO();
//    	productVO1.setMerchant_no("ME00001");
//    	productVO1.setProduct_name("月世界土雞");
//    	productVO1.setProduct_status("C1");
//    	productVO1.setProduct_pr(120);
//    	productVO1.setProduct_typ("農產品");
//    	productVO1.setProduct_pn("D2");
//    	productVO1.setProduct_ps("雞出的去，人進的來，高雄發大財");
//		productVO1.setProduct_quan("1");
//		dao.insert(productVO1);
//		System.out.println("新增成功");

		// 修改
//		ProductVO productVO2 = new ProductVO();
//		productVO2.setProduct_no("PR00016");
//		productVO2.setMerchant_no("ME00001");
//		productVO2.setProduct_name("燕巢大芭樂");
//		productVO2.setProduct_status("C1");
//		productVO2.setProduct_pr(700);
//		productVO2.setProduct_typ("農產品");
//		productVO2.setProduct_pn("D1");
//		productVO2.setProduct_ps("番石榴是熱帶喬木或灌木，原產於中美洲墨西哥到南美洲北部，被引入到世界各地的熱帶和亞熱帶地區取果實用來食用。在一些國家，種植、加工和出口番石榴果實形成規模龐大的產業。甜味種糖度高，果肉甜脆，適合鮮食；酸味種可加工製果汁、果醬。尚可鹽漬、甘草漬、製罐、製蜜餞、果乾和製酒；葉片和未熟果曬乾研磨成末，可製成健康食品「菝仔茶」。番石榴已經侵入牧草地和野地，排擠當地植物，部分原因是它能夠生長在各種不同的土壤和氣候。在某些官方排名，番石榴是入侵性最高的物種之一。番石榴可以存活30至40年。");
//		productVO1.setProduct_quan("1");
//		dao.update(productVO2);
//		System.out.println("修改成功");		

		// 刪除
//		dao.delete("PR00002");
//		System.out.println("刪除成功");

		// 查詢
//		ProductVO productVO =  dao.findByPrimaryKey("PR00001");
//	
//		System.out.print(productVO.getProduct_no() + ",");
//		System.out.print(productVO.getMerchant_no() + ",");
//		System.out.print(productVO.getProduct_name() + ",");
//		System.out.print(productVO.getProduct_status() + ",");
//		System.out.print(productVO.getProduct_pr() + ",");
//		System.out.print(productVO.getProduct_typ() + ",");
//		System.out.print(productVO.getProduct_pn() + ",");
//		System.out.print(productVO.getProduct_ps() + ",");
//		System.out.print(productVO.getProduct_quan() + ",");
		
//		 查詢
//		List<ProductVO> list = dao.getAll();
//		for (ProductVO plist : list) {
//			System.out.print(plist.getProduct_no() + ",");
//			System.out.print(plist.getMerchant_no() + ",");
//			System.out.print(plist.getProduct_name() + ",");
//			System.out.print(plist.getProduct_status() + ",");
//			System.out.print(plist.getProduct_pr() + ",");
//			System.out.print(plist.getProduct_typ() + ",");
//			System.out.print(plist.getProduct_pn() + ",");
//			System.out.print(plist.getProduct_ps());
//
//		}
		
		
//		// 查詢單一廠商有關商品
//		List<ProductVO> list = dao.findByMerchantNo("ME00001");
//		for (ProductVO plist : list) {
//			System.out.print(plist.getProduct_no() + ",");
//			System.out.print(plist.getMerchant_no() + ",");
//			System.out.print(plist.getProduct_name() + ",");
//			System.out.print(plist.getProduct_status() + ",");
//			System.out.print(plist.getProduct_pr() + ",");
//			System.out.print(plist.getProduct_typ() + ",");
//			System.out.print(plist.getProduct_pn() + ",");
//			System.out.print(plist.getProduct_ps() + ",");
//			System.out.print(plist.getProduct_quan() + ",");
//			System.out.println();
//		}
		
		
		// 修改單一商品上下架狀態
//		ProductVO productVO5 = new ProductVO();
//		productVO5.setProduct_no("PR00005");
//		productVO5.setProduct_status("C1");
//		dao.updateProductStatus(productVO5);
		
		
		// 查詢單一狀態有關商品
//		List<ProductVO> list = dao.getOneStatusOfAll("C1");
//			for (ProductVO plist : list) {
//			System.out.print(plist.getProduct_no() + ",");
//			System.out.print(plist.getMerchant_no() + ",");
//			System.out.print(plist.getProduct_name() + ",");
//			System.out.print(plist.getProduct_status() + ",");
//			System.out.print(plist.getProduct_pr() + ",");
//			System.out.print(plist.getProduct_typ() + ",");
//			System.out.print(plist.getProduct_pn() + ",");
//			System.out.print(plist.getProduct_ps());
//			System.out.println();
//		}
		
		
		// 查詢單一狀態有關商品
		List<ProductVO> list = dao.getOneStatusOfAll("C1","D0");
			for (ProductVO plist : list) {
			System.out.print(plist.getProduct_no() + ",");
			System.out.print(plist.getMerchant_no() + ",");
			System.out.print(plist.getProduct_name() + ",");
			System.out.print(plist.getProduct_status() + ",");
			System.out.print(plist.getProduct_pr() + ",");
			System.out.print(plist.getProduct_typ() + ",");
			System.out.print(plist.getProduct_pn() + ",");
			System.out.print(plist.getProduct_ps());
			System.out.println();
		}
		
	}

}