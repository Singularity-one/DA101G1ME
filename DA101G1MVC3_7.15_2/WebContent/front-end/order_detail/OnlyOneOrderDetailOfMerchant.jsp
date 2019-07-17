<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


<style>

#popBox{
    position: absolute;
    display:none;
    width:300px;
    height:200px;
    left:40%;
    top:20%;
    z-index:11;
    background:#FFFFFF; 
}

#popLayer{
    position: absolute;
    display:none;
    left:0;
    top:0;
    z-index:10;
    background:	#DDDDDD;
    -moz-opacity: 0.8;
    opacity:.80;
    filter: alpha(opacity=80);/* 只支持IE6、7、8、9 */
}

</style>
<script type="text/javascript">
    function popBox(){
        var popBox = document.getElementById('popBox');
        var popLayer = document.getElementById('popLayer');

        popLayer.style.width = document.body.scrollWidth + "px";
        popLayer.style.height = document.body.scrollHeight + "px";

        popLayer.style.display = "block";
        popBox.style.display = "block";
    }//end func popBox()

    function closeBox(){
        var popBox = document.getElementById('popBox');
        var popLayer = document.getElementById('popLayer');

        popLayer.style.display = "none";
        popBox.style.display = "none";

    }//end func closeBox()

</script>



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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
       <b>選擇訂單狀態:</b>
			<select name="order_status">
　				<option value="O1">撿貨</option>
　				<option value="O2">出貨</option>
　				<option value="O3">取消訂單</option>
				<option value="O4">退貨</option>
			</select>
       <input type="hidden" name="action" value="get_OneStatus_Order_detail">
       <input type="hidden" name="merchant_no" value="<%=session.getAttribute("merchant_no")%>">
       <input type="submit" value="送出">
</FORM>

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>廠商編號</th>
		<th>訂單狀態</th>
		<th>訂單總金額</th>
		<th>訂單時間</th>
		<th>取貨地址</th>
		<th>收件人姓名</th>
		<th>收件人電話</th>
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
                <%= "撿貨"%>
				</c:if>
				<c:if test="${order_status == 'O2'}">
				<%= "已出貨"%>
				</c:if>
				<c:if test="${order_status == 'O3'}">
				<%= "取消訂單"%>
				</c:if>
				<c:if test="${order_status == 'O4'}">
				<%= "退貨"%>
				</c:if>
			</td>
			<td>${order_detailVO.order_amosum}</td>
			<td><fmt:formatDate value="${order_detailVO.order_time}" pattern="yyyy-MM-dd"/></td> 
			<td>${order_detailVO.order_cusadr}</td>
			<td>${order_detailVO.order_cusname}</td>
			<td>${order_detailVO.order_cusphone}</td>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_listServlet1" style="margin-bottom: 0px;">
				 <input type="submit" value="明細">
			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}">
			     <input type="hidden" name="action"	value="getOne_For_UpdateFromOrder_detail"></FORM>     
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

   	
</body>
</html>