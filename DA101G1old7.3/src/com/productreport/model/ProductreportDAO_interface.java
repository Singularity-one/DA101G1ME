package com.productreport.model;

import java.util.*;

public interface ProductreportDAO_interface {
	 	public void insert(ProductreportVO productreportVO);
	 	public void update(ProductreportVO productreportVO);
	 	public void delete(String productreport_no);
	 	public ProductreportVO findByPrimaryKey(String productreport_no);
	 	public List<ProductreportVO> getAll();
     //萬用複合查詢(傳入參數型態Map)(回傳 List)
//   public List<ProductreportVO> getAll(Map<String, String[]> map); 
}
