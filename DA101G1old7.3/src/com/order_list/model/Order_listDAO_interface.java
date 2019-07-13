package com.order_list.model;

import java.util.List;

public interface Order_listDAO_interface {
    public void insert(Order_listVO order_listVO);
    public void update(Order_listVO order_listVO);
    public void delete(String order_no, String product_no);
    public Order_listVO findByPrimaryKey(String order_no, String product_no);
    public List<Order_listVO> getAll();
}
