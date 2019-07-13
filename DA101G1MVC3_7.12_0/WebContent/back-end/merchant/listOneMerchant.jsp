<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.merchant.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO"); //EmpServlet.java(Concroller), 存入req的merchantVO物件
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
  #table-1 {
    border: 2px solid black;
    text-align: center;
    border-collapse:collapse;
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

<h4>此頁暫練習採用 Script 的寫法取值:</h4>

<div class="portal">
<div class="logo">
<img src="icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/portal.jsp'>查詢</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/listAllMerchant.jsp'>全部</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>回首頁</a></li>
</ul>
</div>

<div class="main">
<div class="admin container" >
<id class="administrator">Hi! administrator</id>
</div>

<div class="content container">

<table>
	<tr>
		<th>廠商編號</th>
		<th>廠商帳號</th>
		<th>廠商密碼</th>
		<th>廠商商家名稱</th>
		<th>廠商負責人姓名</th>
		<th>廠商地址</th>
		<th>廠商電話</th>
		<th>廠商電子郵件</th>
		<th>廠商狀態</th>
		<th>廠商說明</th>
		<th>廠商圖檔</th>
	</tr>
	<tr>
		<td><%=merchantVO.getMerchant_no()%></td>
		<td><%=merchantVO.getMerchant_id()%></td>
		<td><%=merchantVO.getMerchant_pass()%></td>
		<td><%=merchantVO.getMerchant_name()%></td>
		<td><%=merchantVO.getMerchant_pm()%></td>
		<td><%=merchantVO.getMerchant_add()%></td>
		<td><%=merchantVO.getMerchant_tel()%></td>
		<td><%=merchantVO.getMerchant_email()%></td>
		<td><%=merchantVO.getMerchant_status()%></td>
		<td><%=merchantVO.getMerchant_ps()%></td>
		<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"></td>
<%-- 		<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"><td>		 --%>
	</tr>
</table>

</div>

</body>
</html>