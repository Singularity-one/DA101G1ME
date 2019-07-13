<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.merchant.model.*"%>
<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO");
%>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>GuideMainPage</title>
    <style type="text/css">
    	body{
    		font-family: Microsoft JhengHei;

    	}

		.top{
			padding-top: 7.5%;
			color:#fff;
		}
		.info{
			padding-top: 20px;
			letter-spacing: 4px;
		}
    	.content{
    		margin-top: 5%;
    		height: 900px;
    		padding:80px;
			background-color: #fff;
    	}
		.right{
			margin-left:160px;
		}
    	#guide_pic{
    		height:300px;
    		width:300px;
    		border-radius: 50%;
    		border-color: #fff;
    		border: 3px solid;
    	}
    	.list-group-item{
    		color:#666;
    		padding-left: 20px;
    		letter-spacing: 2px;
    	}
		.title-2{
			line-height: 45px;
			font-family:monospace;
			font-size:18px;
			letter-spacing: 2px;
			font-weight:bold;
			color:dimgray;
			border-bottom: 1px solid #aaa;
		}
		.title{
			font-family:monospace;
			font-size:23px;
			letter-spacing: 2px;
			font-weight:bold;
			color:#666;
		}
		.lang{
			padding-top: 20px;
			padding-bottom: 20px;
			letter-spacing: 2px;
		}
		.outer{
			position: relative;
			z-index: 10;
			background-size:cover;
			background-color: #333;
		}
		#cover{
			position: fixed;
			width: 100%;
			height:auto;
			z-index: -10;
			filter: brightness(0.5);

		}
		a {
   			text-decoration: none !important;
		}
		
		#box12{
     		position: absolute;
     		left:  70%;      /* ������Z��*/
    		top:   5%;     /* ��m���� */
     		text-align: center;
     		font-size: 15px;
     		padding: 10px;
     		border: 1px solid 	#000000;  /*����C�� */
     		background-color: white;
    		box-shadow: 1px 1px 5px #333333;
    		width: 400px;      /* �Ӥ��j�p */
     		transform: rotate(15deg);  /* ���ਤ�� */
     		border-style:solud;  
	 		padding-bottom:50px;  /* �U����Z */
   	    }
   	    
    </style>
  </head>
  <body>
<div class="outer">
<div class="outer">
	<img src="<%=request.getContextPath()%>/MerchantView/image/test1.jpg" id="cover">
	<div class="container">
		<div class="row justify-content-center top">
			<div>
			</div>
			<div>
			</div>
		</div>
	</div>

<div class="row justify-content-center content">
			<div class="col-2">
	</div>
<div class="col-5 right">
<p class="title">�ӽмt��</p>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/MerchantServlet1" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�t�ӷ|���b��:</td>
		<td><input type="TEXT" name="merchant_id" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_id()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӱK�X:</td>
		<td><input type="TEXT" name="merchant_pass" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_pass()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӰӮa�W��:</td>
		<td><input type="TEXT" name="merchant_name" size="45" 
			 value="<%= (merchantVO==null)? "��쪺�a" : merchantVO.getMerchant_name()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӭt�d�H�m�W:</td>
		<td><input type="TEXT" name="merchant_pm" size="45" 
			 value="<%= (merchantVO==null)? "�L���" : merchantVO.getMerchant_pm()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�Ӧa�}:</td>
		<td><input type="TEXT" name="merchant_add" size="45" 
			 value="<%= (merchantVO==null)? "��饫���c�Ϥ��j��300��" : merchantVO.getMerchant_add()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӹq��:</td>
		<td><input type="TEXT" name="merchant_tel" size="45" 
			 value="<%= (merchantVO==null)? "(03)4226062" : merchantVO.getMerchant_tel()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӹq�l�l��:</td>
		<td><input type="TEXT" name="merchant_email" size="45" 
			 value="<%= (merchantVO==null)? "ncucc@cc.ncu.edu.tw" : merchantVO.getMerchant_email()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�Ӫ��A:</td>
		<td><%="���f��" %></td>
	</tr>
	
	<tr>
		<td>�t�ӻ���:</td>
<!-- 		<td><input type="TEXT" name="merchant_ps" size="45"  -->
<%-- 			 value="<%= (merchantVO==null)? "1915�~�Хߦܤ��A���g100�h�~���ѯСA�����j�Ǥw�����ꤺ�ּƾ��v�y�[�B�մ��u���B���A�u�}�����y�j�ǡC�ثe�ǥͤH�Ƭ�1�U2000�H�A���|�X�\�h�u�q�դ͡A����a�^�m�}�h�C" : merchantVO.getMerchant_ps()%>" /></td> --%>
	<td><textarea  name="merchant_ps" style="width:400px;height:120px;"></textarea></td>
	</tr>
	
	<tr>
		<td>�t�ӹϤ�:</td>
		<td>
		<input type="file" name="merchant_img" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png">
	    </td>
	</tr>
	
	
	
</table><br>
<input type="hidden" name="action" value="insert">
<input type="hidden" name="merchant_status" value="A1">
<input type="submit" value="�e�X�s�W"></FORM>
</div>

	<div id="box12">
<%--<img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;"> --%>
 	<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;" />
    </div>

<script>
function readURL(input){

		if(input.files && input.files[0]){

	var imageTagID = input.getAttribute("targetID");
	var reader = new FileReader();
		reader.onload = function (e) {
				var img = document.getElementById(imageTagID);
				img.setAttribute("src", e.target.result)
			 }
		 reader.readAsDataURL(input.files[0]);
		}
}
</script>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>