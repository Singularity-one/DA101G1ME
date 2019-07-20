<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<%=session.getAttribute("mem_no") %>
<center>
	<form action="<%=request.getContextPath()%>/MemberLogin1" method="post">
		
			<table border=1>
				<tr>
					<td colspan=2>
						<p align=center>
							輸入<b>(測試登入)</b>:<br> 
							帳號:<b>MB00006</b><br>
							密碼:<b>MB00006</b><br>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>account:</b>
					</td>
					<td>
						<p>
							<input type=text name="account" value="" size=15>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>password:</b>
					</td>
					<td>
						<p>
							<input type=password name="password" value="" size=15>
					</td>
				</tr>


				<tr>
					<td colspan=2 align=center>
						
							<input type=submit value="  ok   ">
						
					</td>
				</tr>
			</table>
	</form>
	<ul>
  		<li><a href='<%=request.getContextPath()%>/front-end/merchant/addMerchant.jsp'>Add</a> a new Merchant.</li>
  		<li><a href='<%=request.getContextPath()%>/front-end/productreport/addProductreport.jsp'>商品檢舉</a></li>
  		<li><a href='<%=request.getContextPath()%>/front-end/deposit/addDeposit.jsp'>儲值</a></li>
	</ul>
	
</center>
</body>
</html>