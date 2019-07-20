<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.deposit.model.*"%>

<%
 DepositVO depositVO = (DepositVO) request.getAttribute("depositVO");
%>
<%=session.getAttribute("mem_no") %>
<% String str =(String)( session.getAttribute("mem_no")); %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�x�ȸ�Ʒs�W - adddeposit.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�x�ȸ�Ʒs�W - addEmp.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/deposit/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:useBean id="depositSvc" scope="page" class="com.deposit.model.DepositService" />

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DepositServlet1" name="form1">
<table>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="mem_no" size="45" 
			 value="<%=str%>" /></td>
	</tr>
	
<!-- 	<tr> -->
<!-- 		<td>�x�Ȯɶ�:</td> -->
<!-- 		<td><input name="deposit_time" id="f_date1" type="date"></td> -->
<!-- 	</tr> -->
	<tr>
		<td>�x�Ȫ��B:</td>
		<td><input type="TEXT" name="deposit_amo" size="45"
			 value="<%= (depositVO==null)? "10000" : depositVO.getDeposit_amo()%>" /></td>
	</tr>


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="mem_no" value="<%=session.getAttribute("mem_no") %>">
<input type="submit" value="�e�X�s�W"></FORM>

</body>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Date deposit_time = null;
  try {
	  deposit_time =  depositVO.getDeposit_time();
   } catch (Exception e) {
	  deposit_time = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>



</html>