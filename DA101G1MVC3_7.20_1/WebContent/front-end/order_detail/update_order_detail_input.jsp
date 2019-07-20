<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order_detail.model.*"%>
<%
Order_detailVO order_detailVO = (Order_detailVO) request.getAttribute("order_detailVO"); //Order_detailServlet.java (Concroller) �s�Jreq��merchantVO���� (�]�A�������X��order_detailVO, �]�]�A��J��ƿ��~�ɪ�order_detailVO����)
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>���u��ƭק� - update_order_detail_input.jsp</title>

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
		 <h3>�q���ƭק� - update_order_detail_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/order_detail/order_detail_select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/order_detail/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" name="form1" >
<table>
	<tr>
		<td>�q��s��:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_no()%></td>
	</tr>
	
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getMem_no()%></td>
	</tr>
	
	<tr>
		<td>�t�ӽs��:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getMerchant_no()%></td>
	</tr>
	
	<tr>
		<td>�q�檬�A:</td>
		<td><input type="TEXT" name="order_status" size="45" value="<%=order_detailVO.getOrder_status()%>" /></td>
	</tr>
	
	<tr>
		<td>�q���`���B:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_amosum()%></td>
	</tr>
	
	<tr>
		<td>�q��ɶ�:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_time()%></td>
	</tr>
	
	<tr>
		<td>���f�a�}:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_cusadr()%></td>
	</tr>
	
	<tr>
		<td>����H�m�W:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_cusname()%></td>
	</tr>
	
	<tr>
		<td>����H�q��:<font color=red><b>*</b></font></td>
		<td><%=order_detailVO.getOrder_cusphone()%></td>
	</tr>
	
	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="order_no" value="<%=order_detailVO.getOrder_no()%>">
<input type="hidden" name="mem_no" value="<%=order_detailVO.getMem_no()%>">
<input type="hidden" name="merchant_no" value="<%=order_detailVO.getMerchant_no()%>">
<input type="hidden" name="order_amosum" value="<%=order_detailVO.getOrder_amosum()%>">
<input type="hidden" name="order_time" value="<%=order_detailVO.getOrder_time()%>">
<input type="hidden" name="order_cusadr" value="<%=order_detailVO.getOrder_cusadr()%>">
<input type="hidden" name="order_cusname" value="<%=order_detailVO.getOrder_cusname()%>">
<input type="hidden" name="order_cusphone" value="<%=order_detailVO.getOrder_cusphone()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>

</html>