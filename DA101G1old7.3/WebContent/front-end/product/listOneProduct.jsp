<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>


<html>
<head>
<title>���u��� - listOneEmp.jsp</title>

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
		 <h3>���u��� - ListOneEmp.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�t�ӽs��</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�s�i�P�P���A</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�ƶq</th>
	</tr>
	<tr>
		<td><%=productVO.getProduct_no()%></td>
		<td><%=productVO.getMerchant_no()%></td>
		<td><%=productVO.getProduct_name()%></td>
		<td><%=productVO.getProduct_status()%></td>
		<td><%=productVO.getProduct_pr()%></td>
		<td><%=productVO.getProduct_typ()%></td>
		<td><%=productVO.getProduct_pn()%></td>
		<td><%=productVO.getProduct_ps()%></td>
		<td>
		<img src="<%=request.getContextPath()%>/ProductImageShow?product_no=${productVO.product_no}" width="300vm"  height="200vm">
		</td>
		<td><%=productVO.getProduct_quan()%></td>
	</tr>
</table>

</body>
</html>