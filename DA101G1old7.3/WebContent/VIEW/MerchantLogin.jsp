<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="BIG5"%>+
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.merchant.model.*"%>
<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<center>
	<form action="<%=request.getContextPath()%>/MerchantLogin" method="post">
		
			<table border=1>
				<tr>
					<td colspan=2>
						<p align=center>
							��J<b>(���յn�J)</b>:<br> 
							�b��:<b>tomcat/David/Qishan</b><br>
							�K�X:<b>tomcat/David/Qishan</b><br>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>account:</b>
					</td>
					<td>
						<p>
							<input type=text name="merchant_id" value="" size=15>
					</td>
				</tr>

				<tr>
					<td>
						<p align=right>
							<b>password:</b>
					</td>
					<td>
						<p>
							<input type=password name="merchant_pass" value="" size=15>
					</td>
				</tr>


				<tr>
					<td colspan=2 align=center>
						
							<input type=submit value="  ok   ">
						
					</td>
				</tr>
			</table>
	</form>
	<%=session.getAttributeNames() %>
</center>
</body>
</html>