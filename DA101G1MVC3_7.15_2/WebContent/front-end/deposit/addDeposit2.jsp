<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.deposit.model.*"%>

<%
 DepositVO depositVO = (DepositVO) request.getAttribute("depositVO");
%>
<%=session.getAttribute("mem_no") %>
<% String str =(String)( session.getAttribute("mem_no")); %>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style type="text/css">
    	.custom-checkbox .custom-control-label::before{
    		background-color: #eee;
    		border-color: #aaa;
    	}
    	.custom-control-input:checked~.custom-control-label::before{
    		background-color: #fa0;
    		border-color: #fa0;
    	}
		/*-------------------------------*/
		.custom-control{
			padding-left: 0;
		}
		.custom-control-label{
			padding-left: 1.5rem;
		}
		.custom-control-label::before,
		.custom-control-label::after{ left: 0; }
		/*-------------------------------*/
		.custom-control-label::after{
			background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%23fff' d='M6.564.75l-3.59 3.612-1.538-1.55L0 4.26 2.974 7.25 8 2.193z'/%3e%3c/svg%3e");
			transform: scale(0);
			transition: .2s cubic-bezier(.87,1.82,.87,1.71);
		}
    	.custom-checkbox .custom-control-input:checked~.custom-control-label::after{
    		transform: scale(1.65);
    	}
    </style> 

</head>

<body bgcolor='white'>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="container-fluid">
  		<div class="row justify-content-center">
  			<div class="col-8">
  					<div>
  					  <img src="<%=request.getContextPath()%>/front-end/deposit/images/Lifestyle.jpg">
  					</div>
  			<jsp:useBean id="depositSvc" scope="page" class="com.deposit.model.DepositService" />
  				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/DepositServlet1" name="form1">
  					<div class="form-group">
  						<label>信用卡號
  					</div>
  					<div class="form-group form-row">
  						<div class="col">
  							<input type="text" name="" class="form-control">
  						</div>
  						<div class="col">
  							<input type="text" name="" class="form-control">
  						</div>
  						<div class="col">
  							<input type="text" name="" class="form-control">
  						</div>
  						<div class="col">
  							<input type="text" name="" class="form-control">
  						</div>
  					</div>
  				<table>
  					<tr>
					<td>會員編號:</td>
					<td><%=session.getAttribute("mem_no") %></td>
					</tr>
					<tr>
					<td>儲值金額:</td>
					<td><input type="TEXT" name="deposit_amo" size="45" value="<%= (depositVO==null)? "10000" : depositVO.getDeposit_amo()%>" /></td>
					</tr>
				</table>	

				<input type="hidden" name="action" value="insert">
				<input type="hidden" name="mem_no" value="<%=session.getAttribute("mem_no") %>">
				<input type="submit" value="儲值">
				</FORM>
  			</div>
  		</div>
  	</div>

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>