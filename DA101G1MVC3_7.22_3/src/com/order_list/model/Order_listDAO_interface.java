package com.order_list.model;

import java.util.List;

import com.promotion.model.PromotionVO;

public interface Order_listDAO_interface {
    public void insert(Order_listVO order_listVO);
    public void update(Order_listVO order_listVO);
    public void delete(String order_no, String product_no);
    public Order_listVO findByPrimaryKey(String order_no, String product_no);
    public List<Order_listVO> getAll();
  //萬用複合查詢(傳入參數型態Map)(回傳 List)
  //public List<Order_listVO> getAll(Map<String, String[]> map); 
    
    
    //查詢單一訂單有關明細
  	public List<Order_listVO> findOneOrder_listByOrder_no(String order_no);
  	
  	//查詢單一訂單有關明細有限單一廠商
  	public List<Order_listVO> findOneOrder_listByOrder_no(String order_no,String merchant_no);
}
