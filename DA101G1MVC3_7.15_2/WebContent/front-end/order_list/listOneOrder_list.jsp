<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.order_list.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
Order_listVO order_listVO = (Order_listVO) request.getAttribute("order_listVO"); //Order_listServlet.java(Concroller), �s�Jreq��empVO����
%>
<!DOCTYPE html>
<html>
<head>
<title>���u��� - listOneOrder_list.jsp</title>

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
		 <h3>���u��� - ListOneOrder_list.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/order_list/order_list_select_page.jsp"><img src="<%=request.getContextPath()%>/order_list/merchant/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�q��s��</th>
		<th>�ӫ~�s��</th>
		<th>�q�椤�ӫ~���B</th>
		<th>�q�ʼƶq</th>
	</tr>
	<tr>
		<td><%=order_listVO.getOrder_no()%></td>
		<td><%=order_listVO.getProduct_no()%></td>
		<td><%=order_listVO.getOrder_product_pr()%></td>
		<td><%=order_listVO.getOrder_quan()%></td>
	</tr>
</table>

</body>
</html>