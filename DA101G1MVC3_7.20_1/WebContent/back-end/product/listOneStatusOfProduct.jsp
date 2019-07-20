<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<% 
 		List<ProductVO> list = (List<ProductVO>) request.getAttribute("get_OneStatus_Product"); //EmpServlet.java(Concroller), �s�Jreq��merchantVO����
 		pageContext.setAttribute("list",list);
%> 


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
	width: 1200px;
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
<h4>�����m�߱ĥ� EL ���g�k����:</h4>


<div class="content container"  style=" display: flex;flex-direction: column;" >
<table style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
	<tr style="border-top:3px #4682B4 solid;border-bottom:3px #4682B4 solid;">
		<th>�ӫ~�s��</th>
		<th>�t�ӽs��</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�s�i�P�P���A</th>
		<th>�ӫ~����</th>
		<th>�ӫ~����</th>
		<th>�ק�</th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr ${(productVO.product_no==param.product_no) ? 'bgcolor=#E0FFFF':''}>
			<td>${productVO.product_no}</td>
			<td>${productVO.merchant_no}</td>
			<td>${productVO.product_name}</td>
			<td>
			<c:set var="product_status" value="${productVO.product_status}"/>
			<c:if test="${product_status == 'C0'}">
            	<%= "�U�["%>
			</c:if>
			<c:if test="${product_status == 'C1'}">
            	<%= "�W�["%>
			</c:if>	
			</td>
			<td>${productVO.product_pr}</td>
			<td>${productVO.product_typ}</td> 
			<td>
			<c:set var="product_pn" value="${productVO.product_pn}"/>
			<c:if test="${product_pn == 'D0'}">
            	<%= "�L"%>
			</c:if>
			<c:if test="${product_pn == 'D1'}">
            	<%= "��"%>
			</c:if>
			</td>
			<td>${productVO.product_ps}</td>
			<td>
			<img src="<%=request.getContextPath()%>/ProductImageShow?product_no=${productVO.product_no}" width="300vm"  height="200vm">
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="product_no"  value="${productVO.product_no}">
			     <input type="hidden" name="product_status"  value="C0">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="product_status_one"  value="one">
			     <input type="hidden" name="action"	value="getOneProductStatus_Update_Back"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</div>

</body>
</html>