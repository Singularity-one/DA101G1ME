<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promotion.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>


<%=session.getAttribute("merchant_no")%>
  
<%  	
	PromotionService promotionSvc = new PromotionService();
    List<PromotionVO> list = promotionSvc.getOneMerchantNo((String)(session.getAttribute("merchant_no")));
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

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�s�i�W��</th>
		<th>�s�i�}�l���</th>
		<th>�s�i�������</th>
		<th>�ӫ~�P�P�馩</th>
		<th>�s�i����</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
		<th></th>
		<th></th>
	</tr>
	<%@ include file="page/page1.file" %>   
	<c:forEach var="promotionVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${promotionVO.product_no}</td>
			<td>${promotionVO.promotion_name}</td>
			<td>${promotionVO.promotion_start}</td>
			<td>${promotionVO.promotion_end}</td>
			<td>${promotionVO.promotion_pr}</td>
			<td>${promotionVO.promotion_ps}</td>
			<td>
			<c:set var="promotion_status" value="${promotionVO.promotion_status}"/>
				<c:if test="${promotion_status == 'B1'}">
                <%= "���f��"%>
				</c:if>
				<c:if test="${promotion_status == 'B2'}">
				<%= "�W�["%>
				</c:if>
				<c:if test="${promotion_status == 'B3'}">
				<%= "�U�["%>
				</c:if>
			
			</td>
			<td><img src="<%=request.getContextPath()%>/PromotionImageShow?promotion_no=${promotionVO.promotion_no}"  width="300vm"  height="200vm" ></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			  
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</body>
</html>