<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>IBM Order_detail_select_page: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Order_detail_select_page: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Order_detail_select_page: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/order_detail/listAllOrder_detail.jsp'>List</a> all Order_detail_select_page.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
        <b>��J�q��s�� (�pOR00001):</b>
        <input type="text" name="order_no">
        <input type="hidden" name="action" value="getOne_For_Order_detail">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="order_detailSvc" scope="page" class="com.order_detail.model.Order_detailService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
       <b>��ܭq��s��:</b>
       <select size="1" name="order_no">
         <c:forEach var="order_detailVO" items="${order_detailSvc.all}" > 
          <option value="${order_detailVO.order_no}">${order_detailVO.order_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Order_detail">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
       <b>��ܲ��~:</b>
       <select size="1" name="order_no">
         <c:forEach var="order_detailVO" items="${order_detailSvc.all}" > 
          <option value="${order_detailVO.order_no}">${order_detailVO.mem_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Order_detail">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
 <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
        <b>��J�q��s�� (�p2019-07-07):</b>
        <input type="text" name="order_time_start">
         <input type="text" name="order_time_end">
        <input type="hidden" name="action" value="getOrder_detail_Day">
        <input type="hidden" name="merchant_no" value="<%=session.getAttribute("merchant_no")%>">
        <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  
</ul>


<h3>�޲z</h3>

<ul>
  <li><a href='addOrder_detail.jsp'>Add</a> a new Order_detail.</li>
</ul>

</body>
</html>