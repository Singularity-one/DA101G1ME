package com.merchant.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.merchant.model.MerchantVO;


public class GsonMerchant {
	
	
	public static MerchantVO get_GsonMerchant() {
		
		Gson gson = new Gson();
		// 遇到日期格式資料，在創建gson物件同時也指定日期格式 (Client - Server需一致)
		//Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		
		String jsonStr = "";

		// Data for testing
		MerchantVO merchantVO1 = new MerchantVO();
		merchantVO1.setMerchant_id("Kadokawa");
		merchantVO1.setMerchant_pass("Kadokawa");
		merchantVO1.setMerchant_name("台灣角川");
		merchantVO1.setMerchant_pm("藍鳳凰");
		merchantVO1.setMerchant_add("105台北市松山區光復北路11巷44號");
		merchantVO1.setMerchant_tel(" (02)27472433");
		merchantVO1.setMerchant_email("Email:service@kadokawa.com.tw");
		merchantVO1.setMerchant_status("A1");
		merchantVO1.setMerchant_ps("簡稱為台角，是日本角川集團在台灣設立的出版公司");
		
		return merchantVO1;
		
	}
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
