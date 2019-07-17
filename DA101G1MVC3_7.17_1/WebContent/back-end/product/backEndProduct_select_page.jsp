<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Emp: Home</title>

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
   <tr><td><h3>IBM Emp: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Emp: Home</p>

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
  <li><a href='listAllProduct.jsp'>List</a> all Emps.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" >
        <b>��J�ӫ~�s�� (�pPR00001):</b>
        <input type="text" name="product_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

   <jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService" />
   
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" >
       <b>��ܰӫ~�s��:</b>
       <select size="1" name="product_no">
         <c:forEach var="productVO" items="${productSvc.all}" > 
          <option value="${productVO.product_no}">${productVO.product_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" >
       <b>��ܼt�ӽs��:</b>
       <select size="1" name="product_no">
         <c:forEach var="productVO" items="${productSvc.all}" > 
          <option value="${productVO.product_no}">${productVO.merchant_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" >
       <b>��ܰӫ~���A:</b>
    		<select name="product_status">
�@				<option value="C0">�U�[</option>
�@				<option value="C1">�W�[</option>
			</select>
       <input type="hidden" name="action" value="get_OneStatus_Product">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductServlet1" >
       <b>��ܰӫ~���A:</b>
    		<select name="product_status">
�@				<option value="C0">�U�[</option>
�@				<option value="C1">�W�[</option>
			</select>
	   <b>��ܼs�i���A:</b>
	   		<select name="product_pn">
�@				<option value="D0">�S���s�i�P�P���A</option>
�@				<option value="D1">���s�i�P�P���A</option>
			</select>
       <input type="hidden" name="action" value="get_TwoStatus_Product">
       <input type="submit" value="�e�X">
     </FORM>
  </li>

</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addProduct.jsp'>Add</a> a new Emp.</li>
</ul>

</body>
</html>