package com.order_list.model;

import java.util.List;

public class Order_listService {
	private Order_listDAO_interface dao;

	public Order_listService() {
		dao = new Order_listJDBCDAO();
	}

	public Order_listVO addOrder_list(String order_no, String product_no, Integer order_product_pr,
			Integer order_quan) {

		Order_listVO order_listVO = new Order_listVO();

		order_listVO.setOrder_no(order_no);
		order_listVO.setProduct_no(product_no);
		order_listVO.setOrder_product_pr(order_product_pr);
		order_listVO.setOrder_quan(order_quan);

		dao.insert(order_listVO);

		return order_listVO;
	}

	public Order_listVO updateOrder_list(String order_no, String product_no, Integer order_product_pr,
			Integer order_quan) {

		Order_listVO order_listVO = new Order_listVO();

		order_listVO.setOrder_no(order_no);
		order_listVO.setProduct_no(product_no);
		order_listVO.setOrder_product_pr(order_product_pr);
		order_listVO.setOrder_quan(order_quan);
		dao.update(order_listVO);

		return order_listVO;
	}

	public void deleteOrder_list(String order_no, String product_no) {
		dao.delete(order_no, product_no);
	}

	public Order_listVO getOneOrder_list(String order_no, String product_no) {
		return dao.findByPrimaryKey(order_no, product_no);
	}

	public List<Order_listVO> getAll() {
		return dao.getAll();
	}
}
