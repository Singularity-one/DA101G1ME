<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.order_detail.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
Order_detailVO order_detailVO = (Order_detailVO) request.getAttribute("order_detailVO"); //Order_detailVOServlet.java(Concroller), 存入req的order_detailVOVO物件
%>
<!DOCTYPE html>
<html>
<head>
<title>訂單資料 - listOneOrder_detail.jsp</title>

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

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>員工資料 - ListOneOrder_detail.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/order_detail/Order_detail_select_page.jsp"><img src="<%=request.getContextPath()%>/order_detail/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
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
		<td><%=order_detailVO.getOrder_no()%></td>
		<td><%=order_detailVO.getMem_no()%></td>
		<td><%=order_detailVO.getMerchant_no()%></td>
		<td><%=order_detailVO.getOrder_status()%></td>
		<td><%=order_detailVO.getOrder_amosum()%></td>
		<td><%=order_detailVO.getOrder_time()%></td>
		<td><%=order_detailVO.getOrder_cusadr()%></td>
		<td><%=order_detailVO.getOrder_cusname()%></td>
		<td><%=order_detailVO.getOrder_cusphone()%></td>
	</tr>
</table>

</body>
</html>