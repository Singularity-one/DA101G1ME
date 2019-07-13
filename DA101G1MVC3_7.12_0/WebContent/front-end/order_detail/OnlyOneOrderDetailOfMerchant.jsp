<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<%=session.getAttribute("merchant_no")%>
<%
	Order_detailService order_detailSvc = new Order_detailService();
    List<Order_detailVO> list = order_detailSvc.getOrder_detailByMerchantNo((String)(session.getAttribute("merchant_no")));
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�Ҧ��s�i��� - listAllPromotion.jsp</title>
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
	width: 800px;
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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
       <b>��ܭq�檬�A:</b>
			<select name="order_status">
�@				<option value="O1">�߳f</option>
�@				<option value="O2">�X�f</option>
�@				<option value="O3">�����q��</option>
				<option value="O4">�h�f</option>
			</select>
       <input type="hidden" name="action" value="get_OneStatus_Order_detail">
       <input type="hidden" name="merchant_no" value="<%=session.getAttribute("merchant_no")%>">
       <input type="submit" value="�e�X">
</FORM>

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
		<th></th>
		<th></th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="order_detailVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${order_detailVO.order_no}</td>
			<td>${order_detailVO.mem_no}</td>
			<td>${order_detailVO.merchant_no}</td>
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
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�X�f">
			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}">
			     <input type="hidden" name="order_status"  value="O2">
			     <input type="hidden" name="action"	value="getOneOrder_detailStatus_Update"></FORM>
			</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_listServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="����">
			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}">
			     <input type="hidden" name="action"	value="getOne_For_UpdateFromOrder_detail"></FORM>
				
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</body>
</html>