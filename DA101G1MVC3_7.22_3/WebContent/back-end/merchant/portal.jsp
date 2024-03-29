<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<style>

.portal{
display:flex;
justify-content:center;
}

.admin{
width: 1200px;
height:80px;
margin:0;
padding:0;
background-color:#fcfcfc;
background-size: cover;

}
#logo{
margin:20px;
height:150px;
width:150px;
}
.content{
display:flex;
width:100%;
margin:0;
padding:0;
background-color:	#f0f0f0;
background-size:cover;
margin-bottom: 50px;
}
.status{

flex-direction: colum;
text-align: center;
margin-top:30px;
margin-right:15px;
margin-left: 15px;
margin-bottom: 30px;
background-color:#fff;
}

.list-group{
width: 250px;

}
hr {
    margin-top:7px;
    *margin: 0;
    border: 0;
    color: #fff;
    background-color: #fff; 
    height: 3px;
    width:50%;
}
.number{
font-size: 42pt;
color: #fff;
}
.administrator{
display:flex;
justify-content:flex-end;
margin-right:100px;
line-height: 80px;
}

.footer{
width:100%;
height:100px;
background-color:black;
}
</style>
</head>
<body>



<div class="portal">
<div class="logo">
<img src="<%=request.getContextPath()%>/back-end/merchant/icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/product/portal.jsp'>商品</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/portal.jsp'>查詢</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/merchant/Merchant.jsp'>全部</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/promotion/portal.jsp'>廣告</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>回首頁</a></li>
</ul>
</div>

<div class="main">
<div class="admin container" >
<id class="administrator">Hi! administrator</id>
</div>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="content container">

<div class="status" style="background-color:#d6d6ad;">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
        <b>輸入廠商會員編號 (如ME00001):</b>
        <input type="text" name="merchant_no">
        <input type="hidden" name="action" value="getOne_For_Merchant">
        <input type="submit" value="送出">
</FORM>
</div>


<div class="status" style="background-color:#fff4c1;">
<jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>選擇廠商會員編號:</b>
       <select size="1" name="merchant_no">
         <c:forEach var="merchantVO" items="${merchantSvc.all}" > 
          <option value="${merchantVO.merchant_no}">${merchantVO.merchant_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Merchant">
       <input type="submit" value="送出">
</FORM>
</div>

<div class="status" style="background-color:#c4e1e1;">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>選擇廠商會員帳號:</b>
       <select size="1" name="merchant_no">
         <c:forEach var="merchantVO" items="${merchantSvc.all}" > 
          <option value="${merchantVO.merchant_no}">${merchantVO.merchant_id}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Merchant">
       <input type="submit" value="送出">
</FORM>
</div>

<div class="status" style="background-color:#e1c4c4;">
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
       <b>選擇廠商會員狀態:</b>
			<select name="merchant_status">
　				<option value="A1">未審核</option>
　				<option value="A2">正常</option>
　				<option value="A3">凍結</option>
			</select>
       <input type="hidden" name="action" value="get_OneStatus_Merchant">
       <input type="submit" value="送出">
</FORM>
</div>



</div>
<%if (request.getAttribute("merchantVO")!=null){%>
       <jsp:include page="listOneMerchant.jsp" flush="true"/>
				<%-- <c:import url="<%=request.getContextPath()%>/front-end/promotion/OnlyOnePromotionOfMerchant.jsp"> --%>
				<%-- </c:import> --%>
				<%-- //動態不行用<%=request.getContextPath()%> --%>
<%} %>

<%if (request.getAttribute("List<MerchantVO>")!=null){%>
       <jsp:include page="listOneStatusOfMerchant.jsp" flush="true"/>
				<%-- <c:import url="<%=request.getContextPath()%>/front-end/promotion/OnlyOnePromotionOfMerchant.jsp"> --%>
				<%-- </c:import> --%>
				<%-- //動態不行用<%=request.getContextPath()%> --%>
<%} %>
</div>
</div>






	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>
