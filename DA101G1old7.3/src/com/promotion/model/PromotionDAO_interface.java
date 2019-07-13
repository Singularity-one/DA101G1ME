package com.promotion.model;

import java.util.*;

import com.merchant.model.MerchantVO;

public interface PromotionDAO_interface {
 	public void insert(PromotionVO promotionVO);
 	public void update(PromotionVO promotionVO);
 	public void delete(String productreport_no);
 	public PromotionVO findByPrimaryKey(String productreport_no);
 	public List<PromotionVO> getAll();
// 萬用複合查詢(傳入參數型態Map)(回傳 List)
//public List<PromotionVO> getAll(Map<String, String[]> map); 
 	
    // 查詢單一廠商有關廣告
 	public List<PromotionVO> findByMerchantNo(String merchant_no); 

}
