<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="java.util.*"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Test2.jsp</title>
</head>
<body bgcolor="#FFFFFF">

<%-- 
<%Object About =  session.getAttribute("About");%>
<%=About %>
--%>

<%Object About =  session.getAttribute("About");%>
<%if ( About != null && session.getAttribute("About").equals(2)) {%>

<img src="<%=request.getContextPath()%>/images/tomcat.gif"> 
i am Services


<%}%>
</body>
</html>