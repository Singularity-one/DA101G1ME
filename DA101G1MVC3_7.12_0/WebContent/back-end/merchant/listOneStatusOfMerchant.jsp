<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.merchant.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
		List<MerchantVO> list = (List<MerchantVO>) request.getAttribute("List<MerchantVO>"); //EmpServlet.java(Concroller), �s�Jreq��merchantVO����
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

.content container{
flex-direction: column ;
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

<div class="portal">
<div class="logo">
<img src="icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/portal.jsp'>�d��</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/listAllMerchant.jsp'>����</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>�^����</a></li>
</ul>
</div>

<div class="main">
<div class="admin container" >
<id class="administrator">Hi! administrator</id>
</div>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="content container">

<table id="table-1">
	<tr>
		<th>�t�ӽs��</th>
		<th>�t�ӱb��</th>
		<th>�t�ӱK�X</th>
		<th>�t�ӰӮa�W��</th>
		<th>�t�ӭt�d�H�m�W</th>
		<th>�t�Ӧa�}</th>
		<th>�t�ӹq��</th>
		<th>�t�ӹq�l�l��</th>
		<th>�t�Ӫ��A</th>
		<th>�t�ӻ���</th>
		<th>�t�ӹ���</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
 	<%@ include file="page/page1.file" %>
	<c:forEach var="merchantVO" items="${list}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">		
		<tr>
			<td>${merchantVO.merchant_no}</td>
			<td>${merchantVO.merchant_id}</td>
			<td>${merchantVO.merchant_pass}</td>
			<td>${merchantVO.merchant_name}</td>
			<td>${merchantVO.merchant_pm}</td>
			<td>${merchantVO.merchant_add}</td> 
			<td>${merchantVO.merchant_tel}</td>
			<td>${merchantVO.merchant_email}</td>
			<td>
			<c:set var="merchant_status" value="${merchantVO.merchant_status}"/>
							<c:if test="${merchant_status == 'A1'}">
                				<%= "���f��"%>
								</c:if>
							<c:if test="${merchant_status == 'A2'}">
								<%= "���`"%>
							</c:if>
							<c:if test="${merchant_status == 'A3'}">
								<%= "�ᵲ"%>
							</c:if>
			</td>
			<td>${merchantVO.merchant_ps}</td>
  	    	<td><img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm"></td> 
  	    	


			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�W�[">
			     <input type="hidden" name="merchant_no"  value="${merchantVO.merchant_no}">
			     <input type="hidden" name="merchant_status"  value="A2">
			     <input type="hidden" name="action"	value="getOneMerchantStatus_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�U�[">
			     <input type="hidden" name="merchant_no"  value="${merchantVO.merchant_no}">
			     <input type="hidden" name="merchant_status"  value="A3">
			     <input type="hidden" name="action"	value="getOneMerchantStatus_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</div>

</body>
</html>