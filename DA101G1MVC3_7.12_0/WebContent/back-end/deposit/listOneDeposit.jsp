<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.deposit.model.*"%>

<%
 DepositVO depositVO = (DepositVO) request.getAttribute("depositVO"); //DepositServlet.java(Concroller), �s�Jreq��depositVO����
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�x�ȸ�� - listOneDeposit.jsp</title>

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
	<h1>ASIDE ������</h1>
	<div>
		<a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp">�t�Ӹ�ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp">�ӫ~��ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/promotion/promotion_select_page.jsp">�s�i��ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/productreport/productreport_select_page.jsp">�q���ƺ޲z<br></a> 
	</div>
</aside>

<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - listOneDeposit.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/deposit/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�x�Ƚs��</th>
		<th>�|���s��</th>
		<th>�x�Ȯɶ�</th>
		<th>�x�Ȫ��B</th>
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