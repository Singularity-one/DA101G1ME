<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>


<%=session.getAttribute("merchant_no")%>
  
<%  	
	ProductService productSvc = new ProductService();
    List<ProductVO> list = productSvc.findByMerchantNo((String)(session.getAttribute("merchant_no")));
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>所有廣告資料 - listAllPromotion.jsp</title>
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
	width: 1000px;
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
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>商品編號</th>
		<th>廠商編號</th>
		<th>商品名稱</th>
		<th>商品狀態</th>
		<th>商品價格</th>
		<th>商品種類</th>
		<th>廣告促銷狀態</th>
		<th>商品說明</th>
		<th>商品圖檔</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page/page1.file" %>   
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${productVO.product_no}</td>
			<td>${productVO.merchant_no}</td>
			<td>${productVO.product_name}</td>
			<td>${productVO.product_status}</td>
			<td>${productVO.product_pr}</td>
			<td>${productVO.product_typ}</td> 
			<td>${productVO.product_pn}</td>
			<td>${productVO.product_ps}</td>
			<td>
			<img src="<%=request.getContextPath()%>/ProductImageShow?product_no=${productVO.product_no}" width="300vm"  height="200vm">
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="product_no"  value="${productVO.product_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="下架">
			     <input type="hidden" name="product_no"  value="${productVO.product_no}">
			     <input type="hidden" name="product_status"  value="C0">
			     <input type="hidden" name="action" value="getOneProductStatus_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</body>
</html>