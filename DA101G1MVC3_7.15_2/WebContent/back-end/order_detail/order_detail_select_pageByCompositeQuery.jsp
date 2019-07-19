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
width: 1037px;
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
<img src="icon.jpeg" id="logo">

<ul class="list-group list-group-flush ">
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/order_detail/portal.jsp'>�d��</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/order_detail/Order_detail.jsp'>�q�����</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/order_detail/order_detail_select_pageByCompositeQuery.jsp'>�ƦX�d��</a></li>
  <li class="list-group-item"><a href='<%=request.getContextPath()%>/back-end/Index/portal.jsp'>�^����</a></li>
</ul>
</div>

<div class="main">
<div class="admin container" >
<id class="administrator">Hi! administrator</id>
</div>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="content container" style=" display: flex; ">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
     	<b>��J�|���s�� (�pMB00002):</b>
        <input type="text" name="mem_no"><br>
        <b>��ܭq�檬�A:</b>
    		<select name="order_status">
�@				<option value="O1">�߳f</option>
�@				<option value="O2">�w�X�f</option>
				<option value="O3">�����q��</option>
				<option value="O4">�h�f</option>
			</select><br>
       <b>��ܤ��:</b><br>
                    �}�l���:<input name="order_time_start" id="f_date1" type="date"><br>
		�������:<input name="order_time_end" id="f_date2" type="date"><br>
		<b>��ܪ��B:</b><br>
		�j��h��<input type="TEXT" name="order_amosum_start" size="45"  value="" /><br>
		�p��h��<input type="TEXT" name="order_amosum_end" size="45"  value="" /><br>
         
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listorderDetail_ByCompositeQuery">
     </FORM>
</div>

<div class="content container" style=" display: flex; ">
 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Order_detailServlet1" >
     	<b>��J�|���s�� (�pMB00002):</b>
        <input type="text" name="mem_no"><br>
        
        <b>��ܭq�檬�A:</b>
    		<select name="order_status">
�@				<option value="O1">�߳f</option>
�@				<option value="O2">�w�X�f</option>
				<option value="O3">�����q��</option>
				<option value="O4">�h�f</option>
			</select><br>
       <b>��ܤ��:</b><br>
                    �}�l���:<input name="order_time_start" id="f_date1" type="date"><br>
		�������:<input name="order_time_end" id="f_date2" type="date"><br>
		<b>��ܪ��B:</b><br>
		�j��h��<input type="TEXT" name="order_amosum_start" size="45"  value="" /><br>
		�p��h��<input type="TEXT" name="order_amosum_end" size="45"  value="" /><br>
		
		<b>��J�t�ӽs�� (�pME00001):</b>
        <input type="text" name="merchant_no"><br>
   
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listorderDetail_ByCompositeQuery1">
     </FORM>
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
