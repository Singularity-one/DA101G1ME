<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<%=request.getContextPath()%>/VIEW/showpro.css" rel="stylesheet" type="text/css" />
<title>MERCHANTindex</title>


</head>

<aside id="aside">
	<h1>ASIDE ¥k°¼Ãä</h1>
		<div>
  			<a href="EShop.jsp">About<br></a>
 			<a href="index.html">Services<br></a>
  			<a href="index.html">Clients<br></a>
  			<a href="index.html">Contact<br></a>
		</div>
		
		<div>
		<form name="deleteForm" action="<%=request.getContextPath()%>/IndexController2" method="POST">
              <input type="submit" name="action" value="About">
    	</form>
    	</div>
    	
    	<div>
		<form name="deleteForm" action="<%=request.getContextPath()%>/IndexController2" method="POST">
              <input type="submit" name="action" value="Services">
    	</form>
    	</div>
		
		
		
</aside>

<body id="body">

	<nav>
		·j´MÄæ
	</nav>

	BODY ¤º®e
	
	<h1 id="ex">Test1</h1>
	<img src="<%=request.getContextPath()%>/images/tomcat.gif">
    
    
    <jsp:include page="/VIEW/Test2.jsp" flush="true" />
    <jsp:include page="/VIEW/Test3.jsp" flush="true" />

</body>

</html>