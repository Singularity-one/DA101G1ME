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
  table {
	width: 918px;
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

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;" >
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>�ӫ~�s��</th>
		<th>�s�i�W��</th>
		<th>�}�l���</th>
		<th>�������</th>
		<th>�P�P�馩</th>
		<th>�s�i����</th>
		<th>�s�i���A</th>
		<th>�s�i����</th>
		<th>�ק�</th>
		<th>�U�[</th>
	</tr>
	<%@ include file="pages/page1.file" %>   
	<c:forEach var="promotionVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr ${(promotionVO.promotion_no==param.promotion_no) ? 'bgcolor=#E0FFFF':''}>
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
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			     <input type="hidden" name="promotion_status"  value="B3">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			     <input type="hidden" name="action"	value="getOnePromotionStatus_Update"></FORM>
			  
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

</body>
</html>