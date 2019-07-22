<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promotion.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

 <%	 
 	List<PromotionVO> list = (List<PromotionVO>) request.getAttribute("List<PromotionVO>"); //EmpServlet.java(Concroller), �s�Jreq��merchantVO����
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


<div class="content container" style=" display: flex;flex-direction: column; ">
<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th style=" width: 100px;">�s�i�s��</th>
		<th>�t�ӽs��</th>
		<th style=" width: 100px;">�ӫ~�s��</th>
		<th>�s�i�W��</th>
		<th>�}�l���</th>
		<th>�������</th>
		<th>�P�P�馩</th>
		<th>�s�i����</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
		<th>�W�[</th>
		<th>�U�[</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="promotionVO" items="${list}" >
		
		<tr>
			<td style=" width: 100px;">${promotionVO.promotion_no}</td>
			<td>${promotionVO.merchant_no}</td>
			<td style=" width: 100px;">${promotionVO.product_no}</td>
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
			     <input type="submit" value="�W�[">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			     <input type="hidden" name="promotion_status"  value="B2">
				 <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="action"	value="getOnePromotionStatus_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			     <input type="hidden" name="promotion_status"  value="B3">
			     <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="action"	value="getOnePromotionStatus_Update"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

</div>

</body>
</html>