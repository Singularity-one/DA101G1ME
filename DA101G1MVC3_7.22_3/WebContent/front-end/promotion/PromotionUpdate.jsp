<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promotion.model.*"%>

<%
PromotionVO promotionVO = (PromotionVO) request.getAttribute("promotionVO"); //MerchantServlet.java (Concroller) �s�Jreq��promotionVO���� (�]�A�������X��promotionVO, �]�]�A��J��ƿ��~�ɪ�promotionVO����)
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
     		left:  80%;      /* ������Z��*/
    		top:   -25%;     /* ��m���� */
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
	<img src="<%=request.getContextPath()%>/front-end/merchant/images/test1.jpg" id="cover">
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
	
				<div class="list-group list-group-flush">
					<div class="list-group-item" style="font-family:monospace;font-size: 18px;"><b>���</b></div>
					<a href="<%=request.getContextPath()%>/front-end/merchant/Index/MerchantUpdate.jsp" class="list-group-item">�t�Ӹ��</a>
					<a href="<%=request.getContextPath()%>/front-end/promotion/addPromotion.jsp" class="list-group-item">�s�W�s�i</a>
				</div>
				
			</div>
			<div class="col-5 right"">
				<p class="title">�s�i��ƭק�</p>
				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color:red">�Эץ��H�U���~:</font>
				<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color:red">${message}</li>
				</c:forEach>
				</ul>
				</c:if>	
						
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/PromotionServlet1" name="form1"  enctype="multipart/form-data">
<table>
	<tr>
		<td>�s�i�s��:<font color=red><b>*</b></font></td>
		<td><%=promotionVO.getPromotion_no()%></td>
	</tr>
	<tr>
		<td>�t�ӷ|���b��:</td>
		<td><%=promotionVO.getMerchant_no()%></td>
	</tr>
	<tr>
		<td>�ӫ~�s��:</td>
		<td><%=promotionVO.getProduct_no()%></td>
	</tr>
	<tr>
		<td>�s�i�W��:</td>
		<td><%=promotionVO.getPromotion_name()%></td>
	</tr>
	<tr>
		<td>�s�i�}�l���:</td>
		<td><input type="TEXT" id="f_date1"  name="promotion_start" size="45" value="<%=promotionVO.getPromotion_start()%>" /></td>
	</tr>

	<tr>
		<td>�s�i�������:</td>
		<td><input type="TEXT" id="f_date2"  name="promotion_end" size="45" value="<%=promotionVO.getPromotion_end()%>" /></td>
	</tr>
	<tr>
		<td>�ӫ~�P�P�馩:</td>
		<td><input type="TEXT" name="promotion_pr" size="45" value="<%=promotionVO.getPromotion_pr()%>" /></td>
	</tr>
	<tr>
		<td>�s�i����:</td>
<%-- 		<td><input type="TEXT" name="promotion_ps" size="45" value="<%=promotionVO.getPromotion_ps()%>" /></td> --%>
		<td><textarea  name="promotion_ps" style="width:400px;height:120px;"><%=promotionVO.getPromotion_ps()%></textarea></td>
	</tr>
	<tr>
		<td>�s�i���A:</td>
		<td>
		<c:set var="promotion_status" value="<%=promotionVO.getPromotion_status()%>"/>
				<c:if test="${promotion_status == 'B1'}">
                <%= "�s�i���A:���f��"%>
				</c:if>
				<c:if test="${promotion_status == 'B2'}">
				<%= "�s�i���A:�W�["%>
				</c:if>
				<c:if test="${promotion_status == 'B3'}">
				<%= "�s�i���A:�U�["%>
				</c:if>
		</td>
	</tr>
	<tr>
		<td>�t�ӹϤ�:</td>
		<td>
<!-- 	<input type="file" name="merchant_img" id="merchant_input" accept="image/gif, image/jpeg, image/png" > -->
		<input type="file" name="promotion_img" onchange="readURL(this)" targetID="preview_progressbarTW_img" accept="image/gif, image/jpeg, image/png">
	    </td>
		</tr>
		</table>
		
		<br>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="promotion_no" value="<%=promotionVO.getPromotion_no()%>">
		<input type="hidden" name="merchant_no" value="<%=promotionVO.getMerchant_no()%>">
		<input type="hidden" name="product_no" value="<%=promotionVO.getProduct_no()%>">
		<input type="hidden" name="promotion_name" value="<%=promotionVO.getPromotion_name()%>">
		<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
		<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--�u�Ω�:istAllEmp.jsp-->
		<input type="hidden" name="promotion_status" value="1">
		<input type="submit" value="�e�X�ק�"></FORM>

		<div id="box12">
<%--          			<img src="<%=request.getContextPath()%>/MerchantImageShow?merchant_no=${merchantVO.merchant_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;"> --%>
 		<img id="preview_progressbarTW_img" src="<%=request.getContextPath()%>/PromotionImageShow?promotion_no=${promotionVO.promotion_no}" width="300vm"  height="200vm" style="width:375px; hight=360px;" />	
	
	</div>
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