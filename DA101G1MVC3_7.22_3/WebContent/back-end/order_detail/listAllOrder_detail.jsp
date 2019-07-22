<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	Order_detailService order_detailSvc = new Order_detailService();
    List<Order_detailVO> list = order_detailSvc.getAll();
    pageContext.setAttribute("list",list);
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

<div class="portal">
<div class="logo">
</div>

<div class="main">
</div>

<div class="content container" style=" display: flex;flex-direction: column; ">


<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>�q��s��</th>
		<th>�|���s��</th>
<!-- 		<th>�t�ӽs��</th> -->
		<th>�q�檬�A</th>
		<th>�q���`���B</th>
		<th>�q��ɶ�</th>
		<th>���f�a�}</th>
		<th>����H�m�W</th>
		<th>����H�q��</th>
		<th></th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="order_detailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
<%-- 			<td>${order_detailVO.order_no}</td> --%>
			<td><A href="<%=request.getContextPath()%>/Order_listServlet1?order_no=${order_detailVO.order_no}&action=getOne_From06">${order_detailVO.order_no}</a></td>
			<td>${order_detailVO.mem_no}</td>
<%-- 			<td>${order_detailVO.merchant_no}</td> --%>
			<td>
			<c:set var="order_status" value="${order_detailVO.order_status}"/>
				<c:if test="${order_status == 'O1'}">
                <%= "�߳f"%>
				</c:if>
				<c:if test="${order_status == 'O2'}">
				<%= "�w�X�f"%>
				</c:if>
				<c:if test="${order_status == 'O3'}">
				<%= "�����q��"%>
				</c:if>
				<c:if test="${order_status == 'O4'}">
				<%= "�h�f"%>
				</c:if>
			</td>
			<td>${order_detailVO.order_amosum}</td>
			<td><fmt:formatDate value="${order_detailVO.order_time}" pattern="yyyy-MM-dd"/></td> 
			<td>${order_detailVO.order_cusadr}</td>
			<td>${order_detailVO.order_cusname}</td>
			<td>${order_detailVO.order_cusphone}</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�ק�"> -->
<%-- 			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</div>

</body>
</html>