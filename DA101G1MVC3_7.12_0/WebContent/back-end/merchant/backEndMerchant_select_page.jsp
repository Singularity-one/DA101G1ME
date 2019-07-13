<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>IBM Merchant: Home</title>
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

<table id="table-1">
   <tr><td><h3>IBM Merchant: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Merchant: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/front-end/merchant/listAllMerchant.jsp'>List</a> all Merchants.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
        <b>��J�t�ӷ|���s�� (�pME00001):</b>
        <input type="text" name="merchant_no">
        <input type="hidden" name="action" value="getOne_For_Merchant">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>��ܼt�ӷ|���s��:</b>
       <select size="1" name="merchant_no">
         <c:forEach var="merchantVO" items="${merchantSvc.all}" > 
          <option value="${merchantVO.merchant_no}">${merchantVO.merchant_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Merchant">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>��ܼt�ӷ|���b��:</b>
       <select size="1" name="merchant_no">
         <c:forEach var="merchantVO" items="${merchantSvc.all}" > 
          <option value="${merchantVO.merchant_no}">${merchantVO.merchant_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Merchant">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>��ܼt�ӷ|�����A:</b>
			<select name="merchant_status">
�@				<option value="A1">���f��</option>
�@				<option value="A2">���`</option>
�@				<option value="A3">�ᵲ</option>
			</select>
       <input type="hidden" name="action" value="get_OneStatus_Merchant">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addMerchant.jsp'>Add</a> a new Merchant.</li>
</ul>

</body>
</html>