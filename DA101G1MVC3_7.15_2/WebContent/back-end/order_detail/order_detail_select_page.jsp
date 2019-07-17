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
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>//Order_detailServlet1" >
        <b>��J�q��s�� (�pOR00001):</b>
        <input type="text" name="order_no">
        <input type="hidden" name="action" value="getOne_For_Order_detail">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="order_detailSvc" scope="page" class="com.order_detail.model.Order_detailService" />
   <jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>//Order_detailServlet1" >
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
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>//Order_detailServlet1" >
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
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>//Order_detailServlet1" >
       <b>��ܤ��:</b>
         <select size="1" name="merchant_no">
          	<c:forEach var="merchantVO" items="${merchantSvc.all}" > 
          	<option value="${merchantVO.merchant_no}">${merchantVO.merchant_no}
         	</c:forEach>   
         </select>
       	 <select name="month">
�@				<option value="01">�@��</option>
�@				<option value="02">�G��</option>
�@				<option value="03">�T��</option>
				<option value="04">�|��</option>
				<option value="05">����</option>
				<option value="06">����</option>
				<option value="07">�C��</option>
				<option value="08">�K��</option>
				<option value="09">�E��</option>
				<option value="10">�Q��</option>
				<option value="11">�Q�@��</option>
				<option value="12">�Q�G��</option>
		</select>
       <input type="hidden" name="action" value="getOneMonth_One_Merchant">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
  
  
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
     	<b>��J�|���s�� (�pMB00002):</b>
        <input type="text" name="mem_no">
        <b>��ܭq�檬�A:</b>
    		<select name="order_status">
�@				<option value="O1">�߳f</option>
�@				<option value="O2">�w�X�f</option>
				<option value="O3">�����q��</option>
				<option value="O4">�h�f</option>
			</select>
       <b>��ܤ��:</b>
                    �}�l���:<input name="order_time_start" id="f_date1" type="date"><br>
		�������:<input name="order_time_end" id="f_date2" type="date"><br>
		<b>��ܪ��B:</b>
		�j��h��<input type="TEXT" name="order_amosum_start" size="45"  value="" /><br>
		�p��h��<input type="TEXT" name="order_amosum_end" size="45"  value="" /><br>
         
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listorderDetail_ByCompositeQuery">
     </FORM>
  </li>
  

  
</ul>


<h3>�޲z</h3>

<ul>
  <li><a href='addOrder_detail.jsp'>Add</a> a new Order_detail.</li>
</ul>

</body>
</html>