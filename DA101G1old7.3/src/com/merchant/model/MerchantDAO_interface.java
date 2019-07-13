package com.merchant.model;

import java.util.*;

public interface MerchantDAO_interface {
    public void insert(MerchantVO merchantVO);
    public void update(MerchantVO merchantVO);
    public void delete(String merchant_no);
    public MerchantVO findByPrimaryKey(String merchant_no);
    public List<MerchantVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 
    
    public MerchantVO findByMerchantId(String merchant_id);
    
}
