<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.deposit.model.*"%>

<%
 DepositVO depositVO = (DepositVO) request.getAttribute("depositVO"); //DepositServlet.java(Concroller), 存入req的depositVO物件
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>儲值資料 - listOneDeposit.jsp</title>

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
		 <h3>員工資料 - listOneDeposit.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/deposit/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>儲值編號</th>
		<th>會員編號</th>
		<th>儲值時間</th>
		<th>儲值金額</th>
	</tr>
	<tr>
		<td><%=depositVO.getDeposit_no()%></td>
		<td><%=depositVO.getMem_no()%></td>
		<td><%=depositVO.getDeposit_time()%></td>
		<td><%=depositVO.getDeposit_amo()%></td>
	</tr>
</table>

</body>
</html>