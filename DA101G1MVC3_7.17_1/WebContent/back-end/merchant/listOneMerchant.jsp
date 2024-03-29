<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.merchant.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO"); //EmpServlet.java(Concroller), 存入req的merchantVO物件
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


<style>
  table {
	width: 1200px;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>


<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>

<div class="portal">
<div class="logo">

</div>

<div class="main">

</div>

<div class="content container">

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>廠商編號</th>
		<th>廠商帳號</th>
		<th>廠商密碼</th>
		<th>商家名稱</th>
		<th style=" width: 100px;">負責人</th>
		<th>廠商地址</th>
		<th>廠商電話</th>
		<th>電子郵件</th>
		<th>廠商狀態</th>
		<th>廠商說明</th>
		<th>廠商圖檔</th>
	</tr>
	<tr>
		<td><%=merchantVO.getMerchant_no()%></td>
		<td><%=merchantVO.getMerchant_id()%></td>
		<td><%=merchantVO.getMerchant_pass()%></td>
		<td><%=merchantVO.getMerchant_name()%></td>
		<td style=" width: 100px;"><%=merchantVO.getMerchant_pm()%></td>
		<td><%=merchantVO.getMerchant_add()%></td>
		<td><%=merchantVO.getMerchant_tel()%></td>
		<td><%=merchantVO.getMerchant_email()%></td>
		<td><%=merchantVO.getMerchant_status()%></td>
		<td><%=merchantVO.getMerchant_ps()%></td>
		<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"></td>
<%-- 		<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"><td>		 --%>
	</tr>
</table>

</div>

</body>
</html>