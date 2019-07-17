<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>IBM Productreport: Home</title>

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
   <tr><td><h3>IBM Productreport: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Productreport: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/back-end/productreport/listAllProductreport.jsp'>List</a> all Deposits.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductreportServlet1" >
        <b>��J���|�s�� (�pPR00001):</b>
        <input type="text" name="productreport_no">
        <input type="hidden" name="action" value="getOne_For_Productreport">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="productreportSvc" scope="page" class="com.productreport.model.ProductreportService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductreportServlet1" >
       <b>������|�s��:</b>
       <select size="1" name="productreport_no">
         <c:forEach var="productreportVO" items="${productreportSvc.all}" > 
          <option value="${productreportVO.productreport_no}">${productreportVO.productreport_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Productreport">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ProductreportServlet1" >
       <b>��ܰӫ~�s��::</b>
       <select size="1" name="productreport_no">
         <c:forEach var="productreportVO" items="${productreportSvc.all}" > 
          <option value="${productreportVO.productreport_no}">${productreportVO.product_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Productreport">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addProductreport.jsp'>Add</a> a new Deposit.</li>
</ul>

</body>
</html>