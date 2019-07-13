<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="showpro.css" rel="stylesheet" type="text/css" />
<title>merchanIndex</title>

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
	<h1>ASIDE 左側邊</h1>
	<div>
		<a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp">廠商資料管理<br></a> 
		<a href="">商品資料管理<br></a> 
		<a href="<%=request.getContextPath()%>/front-end/promotion/promotion_select_page.jsp">廣告資料管理<br></a> 
		<a href="">訂單資料管理<br></a> 
	</div>
	
	<li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" >
        <input type="hidden" name="merchant_no" value="<%=session.getAttribute("merchant_no")%>">
        <input type="hidden" name="action" value="getOne_For_Merchant">
        <input type="submit" value="廠商資料管理">
    </FORM>
    </li>
    
     <li><a href='<%=request.getContextPath()%>/front-end/promotion/OnlyOnePromotionOfMerchant.jsp'>廣告資料管理</a></li>
	
</aside>

<body id="body">
	<nav>搜尋欄</nav>
	<%=session.getAttributeNames() %>
    <a href="<%=request.getContextPath()%>/MerchantLogout">登出</a>

</body>
</html>