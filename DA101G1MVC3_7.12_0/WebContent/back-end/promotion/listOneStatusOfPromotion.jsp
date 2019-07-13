<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promotion.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%	
	List<PromotionVO> list = (List<PromotionVO>) request.getAttribute("List<PromotionVO>"); //EmpServlet.java(Concroller), 存入req的merchantVO物件
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

.portal{
display:flex;
justify-content:center;
}

.admin{
width: 1200px;
height:80px;
margin:0;
padding:0;
background-color:#fcfcfc;
background-size: cover;

}
#logo{
margin:20px;
height:150px;
width:150px;
}
.content{
display:flex;
width:100%;
margin:0;
padding:0;
background-color:	#f0f0f0;
background-size:cover;
margin-bottom: 50px;
}
.status{

flex-direction: colum;
text-align: center;
margin-top:30px;
margin-right:15px;
margin-left: 15px;
margin-bottom: 30px;
background-color:#fff;
}

.list-group{
width: 250px;

}
hr {
    margin-top:7px;
    *margin: 0;
    border: 0;
    color: #fff;
    background-color: #fff; 
    height: 3px;
    width:50%;
}
.number{
font-size: 42pt;
color: #fff;
}
.administrator{
display:flex;
justify-content:flex-end;
margin-right:100px;
line-height: 80px;
}

.footer{
width:100%;
height:100px;
background-color:black;
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

</head>



<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>

<div class="portal">
<div class="logo">
<img src="icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/promotion/portal.jsp'>查詢</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/promotion/listAllPromotion.jsp'>全部</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>回首頁</a></li>
</ul>
</div>


<div class="content container">
<table>
	<tr>
		<th>廣告編號</th>
		<th>廠商編號</th>
		<th>商品編號</th>
		<th>廣告名稱</th>
		<th>廣告開始日期</th>
		<th>廣告結束日期</th>
		<th>商品促銷折扣</th>
		<th>廣告說明</th>
		<th>廣告狀態</th>
		<th>廣告圖檔</th>
		<th></th>
		<th></th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="promotionVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${promotionVO.promotion_no}</td>
			<td>${promotionVO.merchant_no}</td>
			<td>${promotionVO.product_no}</td>
			<td>${promotionVO.promotion_name}</td>
			<td>${promotionVO.promotion_start}</td>
			<td>${promotionVO.promotion_end}</td>
			<td>${promotionVO.promotion_pr}</td>
			<td>${promotionVO.promotion_ps}</td>
			<td>
			<c:set var="promotion_status" value="${promotionVO.promotion_status}"/>
							<c:if test="${promotion_status == 'B1'}">
                				<%= "未審核"%>
								</c:if>
							<c:if test="${promotion_status == 'B2'}">
								<%= "上架"%>
							</c:if>
							<c:if test="${promotion_status == 'B3'}">
								<%= "下架"%>
							</c:if>
			</td>
			<td><img src="<%=request.getContextPath()%>/PromotionImageShow?promotion_no=${promotionVO.promotion_no}"  width="300vm"  height="200vm" ></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="上架">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			      <input type="hidden" name="promotion_status"  value="B2">
			     <input type="hidden" name="action"	value="getOnePromotionStatus_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="下架">
			     <input type="hidden" name="promotion_no"  value="${promotionVO.promotion_no}">
			      <input type="hidden" name="promotion_status"  value="B3">
			     <input type="hidden" name="action"	value="getOnePromotionStatus_Update"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</div>

</body>
</html>