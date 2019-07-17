<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.deposit.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
 
<%
    DepositService depositSvc = new DepositService();
    List<DepositVO> list = depositSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�Ҧ��x�ȸ�� - listAllDeposit.jsp</title>
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

<style type="text/css">
     #aside {
	width: 300px;
	height: 100vw;
	text-align: center;
	background-color: #63808F;
	padding: 20px 10px;
	float: right;
	font-family: sans-serif;
	color: #FFF;
	}
</style>


</head>


<aside id="aside">
	<h1>ASIDE ������</h1>
	<div>
		<a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp">�t�Ӹ�ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp">�ӫ~��ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/promotion/promotion_select_page.jsp">�s�i��ƺ޲z<br></a> 
		<a href="<%=request.getContextPath()%>/back-end/productreport/productreport_select_page.jsp">�q���ƺ޲z<br></a> 
	</div>
</aside>

<body bgcolor='white'>

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��x�ȸ�� - listAllDeposit.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/deposit/deposit_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/deposit/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�x�ȳ渹</th>
		<th>�|���s��</th>
		<th>�x�Ȯɶ�</th>
		<th>�x�Ȫ��B</th>
	</tr>
	<%@ include file="page/page1.file" %> 
	<c:forEach var="depositVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${depositVO.deposit_no}</td>
			<td>${depositVO.mem_no}</td>
			<td>${depositVO.deposit_time}</td>
			<td>${depositVO.deposit_amo}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DepositServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="deposit_no"  value="${depositVO.deposit_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DepositServlet1" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="deposit_no"  value="${depositVO.deposit_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page/page2.file" %>

</body>
</html>