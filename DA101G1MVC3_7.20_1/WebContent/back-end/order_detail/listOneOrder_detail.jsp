<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.order_detail.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
Order_detailVO order_detailVO = (Order_detailVO) request.getAttribute("order_detailVO"); //Order_detailVOServlet.java(Concroller), 存入req的order_detailVOVO物件
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
	width: 1000px;
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
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>廠商編號</th>
		<th>訂單狀態</th>
		<th>訂單總金額</th>
		<th>訂單時間</th>
		<th>取貨地址</th>
		<th>收件人姓名</th>
		<th>收件人電話</th>
	</tr>
	<tr>
<%-- 		<td><%=order_detailVO.getOrder_no()%></td> --%>
		<td><A href="<%=request.getContextPath()%>/Order_listServlet1?order_no=${order_detailVO.order_no}&action=getOne_From06">${order_detailVO.order_no}</a></td>
		<td><%=order_detailVO.getMem_no()%></td>
		<td><%=order_detailVO.getMerchant_no()%></td>
		<td><%=order_detailVO.getOrder_status()%></td>
		<td><%=order_detailVO.getOrder_amosum()%></td>
<%-- 		<td><%=order_detailVO.getOrder_time()%></td> --%>
		<td><fmt:formatDate value="${order_detailVO.order_time}" pattern="yyyy-MM-dd"/></td>
		<td><%=order_detailVO.getOrder_cusadr()%></td>
		<td><%=order_detailVO.getOrder_cusname()%></td>
		<td><%=order_detailVO.getOrder_cusphone()%></td>
	</tr>
</table>

</div>

</body>
</html>