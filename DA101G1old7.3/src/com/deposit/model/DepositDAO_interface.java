package com.deposit.model;

import java.util.*;

public interface DepositDAO_interface {
    public void insert(DepositVO depositVO);
    public void update(DepositVO depositVO);
    public void delete(String deposit_no);
    public DepositVO findByPrimaryKey(String deposit_no);
    public List<DepositVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<EmpVO> getAll(Map<String, String[]> map); 
}
