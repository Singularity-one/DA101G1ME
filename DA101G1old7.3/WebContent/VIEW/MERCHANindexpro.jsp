<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="showpro.css" rel="stylesheet" type="text/css" />
<title>MERCHANTindex</title>

	<script type="text/javascript">
	function changeText(){
		var x = document.getElementById("ex");
		if(x.innerHTML =="Test1"){
			document.getElementById("ex").innerHTML ="Test2";
		}else{
			document.getElementById("ex").innerHTML ="Test1";
		}
	}
	</script>



</head>

<aside id="aside">
	<h1>ASIDE ¥k°¼Ãä</h1>
		<div>
  			<a href="EShop.jsp">About<br></a>
 			<a href="index.html">Services<br></a>
  			<a href="index.html">Clients<br></a>
  			<a href="index.html">Contact<br></a>
 
  			<button onclick="changeText()">About<br></button>
  			

  
		</div>
		
</aside>

<body id="body">

<%!int businessType=0;%>

	<nav>
		·j´MÄæ
	</nav>

	BODY ¤º®e
	
	<h1 id="ex">Test1</h1>
	
< 	<jsp:include page="/VIEW/Test.jsp" flush="true" /> 
	
	<script type="text/javascript">

		var businessType = '<%=businessType%>';

	</script>

	'<%=businessType%>'
	

</body>

</html>