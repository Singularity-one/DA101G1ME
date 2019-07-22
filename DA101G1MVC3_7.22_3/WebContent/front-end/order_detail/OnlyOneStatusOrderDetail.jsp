<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.order_detail.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
<%-- <%=session.getAttribute("merchant_no")%> --%>
<%
		List<Order_detailVO> list = (List<Order_detailVO>) session.getAttribute("get_OneStatus_Order_detail"); //EmpServlet.java(Concroller), �s�Jreq��merchantVO����
		pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>GuideMainPage</title>
    <style type="text/css">
    	body{
    		font-family: Microsoft JhengHei;

    	}

		.top{
			padding-top: 7.5%;
			color:#fff;
		}
		.info{
			padding-top: 20px;
			letter-spacing: 4px;
		}
    	.content{
    		margin-top: 5%;
    		height: 900px;
    		padding:80px;
			background-color: #fff;
    	}
		.right{
			margin-left:160px;
		}
    	#guide_pic{
    		height:300px;
    		width:300px;
    		border-radius: 50%;
    		border-color: #fff;
    		border: 3px solid;
    	}
    	.list-group-item{
    		color:#666;
    		padding-left: 20px;
    		letter-spacing: 2px;
    	}
		.title-2{
			line-height: 45px;
			font-family:monospace;
			font-size:18px;
			letter-spacing: 2px;
			font-weight:bold;
			color:dimgray;
			border-bottom: 1px solid #aaa;
		}
		.title{
			font-family:monospace;
			font-size:23px;
			letter-spacing: 2px;
			font-weight:bold;
			color:#666;
		}
		.lang{
			padding-top: 20px;
			padding-bottom: 20px;
			letter-spacing: 2px;
		}
		.outer{
			position: relative;
			z-index: 10;
			background-size:cover;
			background-color: #333;
		}
		#cover{
			position: fixed;
			width: 100%;
			height:auto;
			z-index: -10;
			filter: brightness(0.5);

		}
		a {
   			text-decoration: none !important;
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
    
    
</head>
<body>
  
  
<div class="outer">
	<img src="<%=request.getContextPath()%>/front-end/merchant/images/test1.jpg" id="cover">
	<div class="container">
		<div class="row justify-content-center top">
			<div>
			</div>
			<div>
				<p></p><br>
				<p></p>
				<p></p>
				<p></p>
			</div>
		</div>
	</div>
	
		<div class="row justify-content-center content">
			<div class="col-2" style="top:375px;left:350px;position:absolute;">
				<div class="list-group list-group-flush">
					<div class="list-group-item" style="font-family:monospace;font-size: 18px;"><b>���</b></div>
					<a href="<%=request.getContextPath()%>/front-end/merchant/Index/MerchantUpdate.jsp" class="list-group-item">�t�Ӹ��</a>
					<a href="<%=request.getContextPath()%>/front-end/merchant/Index/MerchantOrder.jsp" class="list-group-item">�q��</a>
					<a href="<%=request.getContextPath()%>/front-end/merchant/Index/MerchantLogin.jsp" class="list-group-item">�^�t�ӭ���</a>
					
				</div>			
			</div>
<div style="top:375px;left:800px;position:absolute;">

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



<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th style=" width: 100px;">�q�檬�A</th>
		<th style=" width: 100px;">�q���`���B</th>
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
<%-- 			<td>${order_detailVO.order_no}</td> --%>
			<td><A href="<%=request.getContextPath()%>/Order_listServlet1?order_no=${order_detailVO.order_no}&merchant_no=<%=session.getAttribute("merchant_no")%>&action=getOne_From05">${order_detailVO.order_no}</a></td>
			<td>${order_detailVO.mem_no}</td>
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
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_listServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="����">
			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}">
			     <input type="hidden" name="action"	value="getOne_For_UpdateFromOrder_detail"></FORM>		
			</td>
			<td>
			<c:if test="${order_status == 'O1'}">
                <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�X�f">
			     <input type="hidden" name="order_no"  value="${order_detailVO.order_no}">
			     <input type="hidden" name="order_status"  value="O2">
			     <input type="hidden" name="action"	value="getOneOrder_detailStatus_Update"></FORM>
			</c:if>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>


</body>
</html>