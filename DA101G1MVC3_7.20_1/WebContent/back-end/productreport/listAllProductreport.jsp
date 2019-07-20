<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productreport.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>
 
<%
    ProductreportService productreportSvc = new ProductreportService();
    List<ProductreportVO> list = productreportSvc.getAll();
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
	width: 600px;
	background-color: white;
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

<h4>此頁練習採用 EL 的寫法取值:</h4>

<div class="portal">
<div class="logo">
<img src="icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/productreport/portal.jsp'>查詢</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/productreport/listAllProductreport.jsp'>全部</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>回首頁</a></li>
</ul>
</div>

<div class="main">
<div class="admin container" >
<id class="administrator">Hi! administrator</id>
</div>

<div class="content container" style=" display: flex;flex-direction: column;" >

<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>商品檢舉編號</th>
		<th>商品編號</th>
		<th>檢舉說明</th>
		<th>檢舉狀態</th>
		<th></th>
		<th></th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="productreportVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${productreportVO.productreport_no}</td>
			<td>${productreportVO.product_no}</td>
			<td>${productreportVO.reportcon_no}</td>
			<td>${productreportVO.reportcon_status}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="商品明細">
			     <input type="hidden" name="product_no"  value="${productreportVO.product_no}">
			     <input type="hidden" name="action"	value="getOne_For_Display"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductreportServlet1" style="margin-bottom: 0px;">
			    <b>選擇檢舉狀態:</b>
				<select name="reportcon_status">
　					<option value="PR2">審核通過 </option>
　					<option value="PR3">審核未通過</option>
				</select>
       			<input type="hidden" name="action" value="getOne_Status_Update">
       			<input type="hidden" name="productreport_no" value="${productreportVO.productreport_no}">
       			<input type="hidden" name="product_no" value="${productreportVO.product_no}">
       			<input type="submit" value="送出">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</div>

</body>
</html>