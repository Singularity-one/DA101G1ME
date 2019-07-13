package com.order_detail.model;

import java.util.List;

public interface Order_detailDAO_interface {
    public void insert(Order_detailVO order_detailVO);
    public void update(Order_detailVO order_detailVO);
    public void delete(String order_no);
    public Order_detailVO findByPrimaryKey(String order_no);
    public List<Order_detailVO> getAll();
}
