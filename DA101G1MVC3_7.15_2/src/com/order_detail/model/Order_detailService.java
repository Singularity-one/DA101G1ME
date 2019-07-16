package com.order_detail.model;

import java.sql.Timestamp;
import java.util.List;

import com.promotion.model.PromotionVO;

public class Order_detailService {

	private Order_detailDAO_interface dao;

	public Order_detailService() {
		dao = new Order_detailJDBCDAO();
	}

	public Order_detailVO addOrder_detail(String mem_no, String merchant_no, String order_status, Integer order_amosum,
			Timestamp order_time, String order_cusadr, String order_cusname, String order_cusphone) {

		Order_detailVO order_detailVO = new Order_detailVO();

		order_detailVO.setMem_no(mem_no);
		order_detailVO.setMerchant_no(merchant_no);
		order_detailVO.setOrder_status(order_status);
		order_detailVO.setOrder_amosum(order_amosum);
		order_detailVO.setOrder_time(order_time);
		order_detailVO.setOrder_cusadr(order_cusadr);
		order_detailVO.setOrder_cusname(order_cusname);
		order_detailVO.setOrder_cusphone(order_cusphone);
		dao.insert(order_detailVO);

		return order_detailVO;
	}

	public Order_detailVO updateOrder_detail(String order_no, String mem_no, String merchant_no, String order_status,
			Integer order_amosum, Timestamp order_time, String order_cusadr, String order_cusname,
			String order_cusphone) {

		Order_detailVO order_detailVO = new Order_detailVO();

		order_detailVO.setOrder_no(order_no);
		order_detailVO.setMem_no(mem_no);
		order_detailVO.setMerchant_no(merchant_no);
		order_detailVO.setOrder_status(order_status);
		order_detailVO.setOrder_amosum(order_amosum);
		order_detailVO.setOrder_time(order_time);
		order_detailVO.setOrder_cusadr(order_cusadr);
		order_detailVO.setOrder_cusname(order_cusname);
		order_detailVO.setOrder_cusphone(order_cusphone);
		dao.update(order_detailVO);

		return order_detailVO;
	}

	public void deleteOrder_detail(String order_no) {
		dao.delete(order_no);
	}

	public Order_detailVO getOneOrder_detail(String order_no) {
		return dao.findByPrimaryKey(order_no);
	}

	public List<Order_detailVO> getAll() {
		return dao.getAll();
	}
	
	//查詢單一廠商有關的訂單
		public List<Order_detailVO> getOrder_detailByMerchantNo(String merchant_no){
			return dao.findOrder_detailByMerchantNo(merchant_no);
	}
		
	//更改單一訂單出貨狀態
	public Order_detailVO updateOrder_detailStatus(String order_no, String order_status) {

		Order_detailVO order_detailVO = new Order_detailVO();

		order_detailVO.setOrder_no(order_no);

		order_detailVO.setOrder_status(order_status);

		dao.updateOrder_detailStatus(order_detailVO);

		return order_detailVO;
	}
	
	
	//查詢單一廠商一種狀態有關的訂單
	public List<Order_detailVO> getOneStatusOrder_detailByMerchantNo(String order_status,String merchant_no){
		return dao.getOneStatusOrder_detailByMerchantNo(order_status, merchant_no);
	}
	
	
	//查詢一個月單一廠商有關的訂單
	public List<Order_detailVO>  getOneMonthOfOneMerchantNo (String month,String merchant_no){
		return dao.getOneMonthOfOneMerchantNo( month,merchant_no);
	}
	
	
	// 管理員查詢一個月單一廠商已出貨全部訂單總金額
	public Order_detailVO getOneMonthOfMerchant (String month,String merchant_no) {
		return dao.getOneMonthOfMerchant( month, merchant_no);
	}
	
	
	//前台廠商輸入時間區間找當日訂單
	public List<Order_detailVO> getAllOneDayOfMerchantNo(String order_time_start,String order_time_end,String merchant_no) {
		return dao.getAllOneDayOfMerchantNo(order_time_start,order_time_end,merchant_no);
	}

	
}
