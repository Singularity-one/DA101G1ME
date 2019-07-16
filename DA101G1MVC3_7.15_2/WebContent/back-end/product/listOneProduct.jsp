<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>


<html>
<head>
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
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/product/portal.jsp'>查詢</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>回首頁</a></li>
</ul>
</div>

<div class="content container" >

<table>
	<tr>
		<th>商品編號</th>
		<th>廠商編號</th>
		<th>商品名稱</th>
		<th>商品狀態</th>
		<th>商品價格</th>
		<th>商品種類</th>
		<th>廣告促銷狀態</th>
		<th>商品說明</th>
		<th>商品圖檔</th>
		<th>商品數量</th>
	</tr>
	<tr>
		<td><%=productVO.getProduct_no()%></td>
		<td><%=productVO.getMerchant_no()%></td>
		<td><%=productVO.getProduct_name()%></td>
		<td><%=productVO.getProduct_status()%></td>
		<td><%=productVO.getProduct_pr()%></td>
		<td><%=productVO.getProduct_typ()%></td>
		<td><%=productVO.getProduct_pn()%></td>
		<td><%=productVO.getProduct_ps()%></td>
		<td>
		<img src="<%=request.getContextPath()%>/ProductImageShow?product_no=${productVO.product_no}" width="300vm"  height="200vm">
		</td>
		<td><%=productVO.getProduct_quan()%></td>
	</tr>
</table>

</div>

</body>
</html>