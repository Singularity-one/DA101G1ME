<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>


<%-- <%=session.getAttribute("merchant_no")%> --%>
  
<%  	
	ProductService productSvc = new ProductService();
    List<ProductVO> list = productSvc.findByMerchantNo((String)(session.getAttribute("merchant_no")));
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�Ҧ��s�i��� - listAllPromotion.jsp</title>

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

<!-- <h4>�����m�߱ĥ� EL ���g�k����:</h4> -->
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;" >
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;" >
		<th>�ӫ~�s��</th>
		<th>�t�ӽs��</th>
		<th style=" width: 100px;">�ӫ~�W��</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�s�i�P�P</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="page/page1.file" %>   
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${productVO.product_no}</td>
			<td>${productVO.merchant_no}</td>
			<td>${productVO.product_name}</td>
			<td>
			<c:set var="product_status" value="${productVO.product_status}"/>
			<c:if test="${product_status == 'C0'}">
                <%= "�U�["%>
			</c:if>
			<c:if test="${product_status == 'C1'}">
                <%= "�W�["%>
			</c:if>
			</td>
			<td>${productVO.product_pr}</td>
			<td>${productVO.product_typ}</td> 
			<td>
			<c:set var="product_pn" value="${productVO.product_pn}"/>
			<c:if test="${product_pn == 'D0'}">
                <%= "�L"%>
			</c:if>
			<c:if test="${product_pn == 'D1'}">
                <%= "��"%>
			</c:if>
			</td>
			<td>${productVO.product_ps}</td>
			<td>
			<img src="<%=request.getContextPath()%>/ProductImageShow?product_no=${productVO.product_no}" width="300vm"  height="200vm">
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="product_no"  value="${productVO.product_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
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