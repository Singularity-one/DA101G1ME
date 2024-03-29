<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.product.model.*"%>

<%
	ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>員工資料修改 - update_emp_input.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>員工資料修改 - update_emp_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>商品編號:<font color=red><b>*</b></font></td>
		<td><%=productVO.getProduct_no()%></td>
	</tr>
	<tr>
	<td>廠商編號:</td>
		<td><input type="TEXT" name="merchant_no" size="45" value="<%=productVO.getMerchant_no()%>" /></td>
	</tr>
	<tr>
	<td>商品名稱:</td>
		<td><input type="TEXT" name="product_name" size="45" value="<%=productVO.getProduct_name()%>" /></td>
	</tr>
	<tr>
	<td>商品狀態:</td>
		<td><input type="TEXT" name="product_status" size="45" value="<%=productVO.getProduct_status()%>" /></td>
	</tr>
	<tr>
	<td>商品價格:</td>
		<td><input type="TEXT" name="product_pr" size="45" value="<%=productVO.getProduct_pr()%>" /></td>
	</tr>
	<tr>
	<td>商品種類:</td>
		<td><input type="TEXT" name="product_typ" size="45" value="<%=productVO.getProduct_typ()%>" /></td>
	</tr>
	<tr>
	<td>廣告促銷狀態:</td>
		<td><input type="TEXT" name="product_pn" size="45" value="<%=productVO.getProduct_pn()%>" /></td>
	</tr>
	<tr>
	<td>商品說明:</td>
		<td><input type="TEXT" name="product_ps" size="45" value="<%=productVO.getProduct_ps()%>" /></td>
	</tr>
	<tr>
		<td>商品圖片:</td>
		<td>
		<input type="file" name="product_img" id="product_input" accept="image/gif, image/jpeg, image/png" >
	    </td>
	</tr>
	<tr>
	<td>商品數量:</td>
		<td><input type="TEXT" name="product_quan" size="45" value="<%=productVO.getProduct_quan()%>" /></td>
	</tr>

	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="product_no" value="<%=productVO.getProduct_no()%>">
<input type="submit" value="送出修改"></FORM>
</body>

</html>