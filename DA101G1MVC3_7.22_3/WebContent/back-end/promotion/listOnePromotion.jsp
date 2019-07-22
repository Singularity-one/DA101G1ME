<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.promotion.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	PromotionVO promotionVO = (PromotionVO) request.getAttribute("promotionVO"); //PromotionServlet.java(Concroller), �s�Jreq��promotionVO����
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

<div class="content container">

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th style=" width: 100px;">�s�i�s��</th>
		<th>�t�ӽs��</th>
		<th style=" width: 100px;">�ӫ~�s��</th>
		<th style=" width: 100px;">�s�i�W��</th>
		<th>�}�l���</th>
		<th>�������</th>
		<th>�P�P�馩</th>
		<th>�s�i����</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
	</tr>
	<tr>
		<td style=" width: 100px;"><%=promotionVO.getPromotion_no()%></td>
		<td><%=promotionVO.getMerchant_no()%></td>
		<td style=" width: 100px;"><%=promotionVO.getProduct_no()%></td>
		<td style=" width: 100px;"><%=promotionVO.getPromotion_name()%></td>
		<td><%=promotionVO.getPromotion_start()%></td>
		<td><%=promotionVO.getPromotion_end()%></td>
		<td><%=promotionVO.getPromotion_pr()%></td>
		<td><%=promotionVO.getPromotion_ps()%></td>
		<td>
		<c:set var="Promotion_status" value="<%=promotionVO.getPromotion_status()%>"/>
		<c:if test="${Promotion_status == 'B1'}">
                	<%= "���f��"%>
		</c:if>
		<c:if test="${Promotion_status == 'B2'}">
					<%= "���`"%>
		</c:if>
		<c:if test="${Promotion_status == 'B3'}">
					<%= "�U�["%>
		</c:if>
		</td>
		<td><img src="<%=request.getContextPath()%>/PromotionImageShow?promotion_no=${promotionVO.promotion_no}" width="300vm"  height="200vm"></td>
	</tr>
</table>

</div>

</body>
</html>