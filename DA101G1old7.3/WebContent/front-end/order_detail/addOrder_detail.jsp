<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order_detail.model.*"%>

<%
	Order_detailVO order_detailVO = (Order_detailVO) request.getAttribute("order_detailVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��Ʒs�W - addEmp.jsp</title>

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
		 <h3>���u��Ʒs�W - addEmp.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" name="form1">
<table>
	<tr>
		<td>�|���s��:</td>
		<td><input type="TEXT" name="mem_no" size="45" 
			 value="<%= (order_detailVO==null)? "MB00001" : order_detailVO.getMem_no()%>" /></td>
	</tr>
	<tr>
		<td>�t�ӽs��:</td>
		<td><input type="TEXT" name="merchant_no" size="45"
			 value="<%= (order_detailVO==null)? "ME00001" : order_detailVO.getMerchant_no()%>" /></td>
	</tr>
	<tr>
		<td>�q�檬�A:</td>
		<td><input type="TEXT" name="order_status" size="45"
			 value="<%= (order_detailVO==null)? "O2" : order_detailVO.getOrder_status()%>" /></td>
	</tr>
	
	<tr>
		<td>�q���`���B:</td>
		<td><input type="TEXT" name="order_amosum" size="45"
			 value="<%= (order_detailVO==null)? "O2" : order_detailVO.getOrder_amosum()%>" /></td>
	</tr>
	
    <tr>
		<td>�q��ɶ�:</td>
		<td><input type="TEXT" name=" order_time" size="45"
			 value="<%= (order_detailVO==null)? "������" : order_detailVO.getOrder_time()%>" /></td>
	</tr>

     <tr>
		<td>���f�a�}:</td>
		<td><input type="TEXT" name="order_cusadr" size="45"
			 value="<%= (order_detailVO==null)? "������" : order_detailVO.getOrder_cusadr()%>" /></td>
	</tr>
	
	<tr>
		<td>����H�m�W:</td>
		<td><input type="TEXT" name="order_cusname" size="45"
			 value="<%= (order_detailVO==null)? "������" : order_detailVO.getOrder_cusname()%>" /></td>
	</tr>
	
	<tr>
		<td>����H�q��:</td>
		<td><input type="TEXT" name="order_cusname" size="45"
			 value="<%= (order_detailVO==null)? "(07)3333333" : order_detailVO.getOrder_cusphone()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>
</body>

</html>