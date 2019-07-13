<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.promotion.model.*"%>

<%
	PromotionVO promotionVO = (PromotionVO) request.getAttribute("promotionVO"); //PromotionServlet.java(Concroller), �s�Jreq��promotionVO����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�s�i��� - listOnePromotion.jsp</title>

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
		 <h3>�s�i��� - listOnePromotion.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/promotion/promotion_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/promotion/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�s�i�s��</th>
		<th>�t�ӽs��</th>
		<th>�ӫ~�s��</th>
		<th>�s�i�W��</th>
		<th>�s�i�}�l���</th>
		<th>�s�i�������</th>
		<th>�ӫ~�P�P�馩</th>
		<th>�s�i����</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
	</tr>
	<tr>
		<td><%=promotionVO.getPromotion_no()%></td>
		<td><%=promotionVO.getMerchant_no()%></td>
		<td><%=promotionVO.getProduct_no()%></td>
		<td><%=promotionVO.getPromotion_name()%></td>
		<td><%=promotionVO.getPromotion_start()%></td>
		<td><%=promotionVO.getPromotion_end()%></td>
		<td><%=promotionVO.getPromotion_pr()%></td>
		<td><%=promotionVO.getPromotion_ps()%></td>
		<td><%=promotionVO.getPromotion_status()%></td>
		<td><img src="<%=request.getContextPath()%>/PromotionImageShow?promotion_no=${promotionVO.promotion_no}" width="300vm"  height="200vm"></td>
	</tr>
</table>

</body>
</html>