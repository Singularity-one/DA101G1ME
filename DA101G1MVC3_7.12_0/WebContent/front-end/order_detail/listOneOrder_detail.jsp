<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.order_detail.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
Order_detailVO order_detailVO = (Order_detailVO) request.getAttribute("order_detailVO"); //Order_detailVOServlet.java(Concroller), �s�Jreq��order_detailVOVO����
%>
<!DOCTYPE html>
<html>
<head>
<title>�q���� - listOneOrder_detail.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneOrder_detail.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/order_detail/Order_detail_select_page.jsp"><img src="<%=request.getContextPath()%>/order_detail/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th>�t�ӽs��</th>
		<th>�q�檬�A</th>
		<th>�q���`���B</th>
		<th>�q��ɶ�</th>
		<th>���f�a�}</th>
		<th>����H�m�W</th>
		<th>����H�q��</th>
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