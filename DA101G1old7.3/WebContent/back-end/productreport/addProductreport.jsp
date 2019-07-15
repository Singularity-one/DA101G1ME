<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.productreport.model.*"%>

<%
	ProductreportVO productreportVO = (ProductreportVO) request.getAttribute("productreportVO");
%>    
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���|��Ʒs�W - addProductreport.jsp</title>

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
		 <h3>���|��Ʒs�W - addProductreport.jsp</h3></td><td>
		 <h4><a href="productreport_select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/productreport/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:useBean id="productreportSvc" scope="page" class="com.productreport.model.ProductreportService" />

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductreportServlet1" name="form1">
<table>

	<tr>
		<td>�ӫ~�s��:</td>
		<td><input type="TEXT" name="product_no" size="45" 
			 value="<%= (productreportVO==null)? "PR00001" : productreportVO.getProduct_no()%>" /></td>
	</tr>
	
	<tr>
		<td>���|����:</td>
		<td><input type="TEXT" name="reportcon_no" size="45" 
			 value="<%= (productreportVO==null)? "�o�O���|" : productreportVO.getReportcon_no()%>" /></td>
	</tr>
	
	<tr>
		<td>���|���A:</td>
		<td><input type="TEXT" name="reportcon_status" size="45" 
			 value="<%= (productreportVO==null)? "PR2" : productreportVO.getReportcon_status()%>" /></td>
	</tr>
	


</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

</body>
</html>