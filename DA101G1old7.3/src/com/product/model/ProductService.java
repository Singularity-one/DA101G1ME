package com.product.model;

import java.util.List;

public class ProductService {
	private ProductDAO_interface dao;

	public ProductService() {
		dao = new ProductJDBCDAO();
	}

	public ProductVO addProduct(String merchant_no, String product_name, String product_status, Integer product_pr, String product_typ, String product_pn, String product_ps, byte[] product_img, Integer product_quan) {

		ProductVO productVO = new ProductVO();

		productVO.setMerchant_no(merchant_no);
		productVO.setProduct_name(product_name);
		productVO.setProduct_status(product_status);
		productVO.setProduct_pr(product_pr);
		productVO.setProduct_typ(product_typ);
		productVO.setProduct_pn(product_pn);
		productVO.setProduct_ps(product_ps);
		productVO.setProduct_img(product_img);
		productVO.setProduct_quan(product_quan);
		dao.insert(productVO);

		return productVO;
	}

	public ProductVO updateProduct(String product_no, String merchant_no, String product_name, String product_status, Integer product_pr, String product_typ, String product_pn, String product_ps, byte[] product_img, Integer product_quan) {

		ProductVO productVO = new ProductVO();
        
		productVO.setProduct_no(product_no);
		productVO.setMerchant_no(merchant_no);
		productVO.setProduct_name(product_name);
		productVO.setProduct_status(product_status);
		productVO.setProduct_pr(product_pr);
		productVO.setProduct_typ(product_typ);
		productVO.setProduct_pn(product_pn);
		productVO.setProduct_ps(product_ps);
		productVO.setProduct_img(product_img);
		productVO.setProduct_quan(product_quan);
	    
		dao.update(productVO);

		return productVO;
	}

	public void deleteProduct(String product_no) {
		dao.delete(product_no);
	}

	public ProductVO getOneProduct(String product_no) {
		return dao.findByPrimaryKey(product_no);
	}

	public List<ProductVO> getAll() {
		return dao.getAll();
	}

}
