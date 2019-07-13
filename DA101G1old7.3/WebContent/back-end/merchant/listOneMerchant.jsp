<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.merchant.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO"); //EmpServlet.java(Concroller), 存入req的merchantVO物件
%>
<!DOCTYPE html>
<html>
<head>
<title>廠商會員資料 - listOneMerchant.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

<style type="text/css">
     #aside {
	width: 300px;
	height: 100vw;
	text-align: center;
	background-color: #63808F;
	padding: 20px 10px;
	float: right;
	font-family: sans-serif;
	color: #FFF;
	}
</style>

</head>

<aside id="aside">
	<h1>ASIDE 左側邊</h1>
	<div>
		<a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp">廠商資料管理<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp">商品資料管理<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/promotion/promotion_select_page.jsp">廣告資料管理<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/productreport/productreport_select_page.jsp">訂單資料管理<br></a> 
	</div>
</aside>

<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>廠商會員資料 - ListOneMerchant.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/merchant/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>廠商編號</th>
		<th>廠商帳號</th>
		<th>廠商密碼</th>
		<th>廠商商家名稱</th>
		<th>廠商負責人姓名</th>
		<th>廠商地址</th>
		<th>廠商電話</th>
		<th>廠商電子郵件</th>
		<th>廠商狀態</th>
		<th>廠商說明</th>
		<th>廠商圖檔</th>
	</tr>
	<tr>
	<td><%=merchantVO.getMerchant_no()%></td>
		<td><%=merchantVO.getMerchant_id()%></td>
		<td><%=merchantVO.getMerchant_pass()%></td>
		<td><%=merchantVO.getMerchant_name()%></td>
		<td><%=merchantVO.getMerchant_pm()%></td>
		<td><%=merchantVO.getMerchant_add()%></td>
		<td><%=merchantVO.getMerchant_tel()%></td>
		<td><%=merchantVO.getMerchant_email()%></td>
		<td><%=merchantVO.getMerchant_status()%></td>
		<td><%=merchantVO.getMerchant_ps()%></td>
		<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"></td>
	</tr>
</table>

</body>
</html>