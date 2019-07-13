<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.merchant.model.*"%>
<%
	MerchantVO merchantVO = (MerchantVO) request.getAttribute("merchantVO");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>廠商資料新增 - addmerchant.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>
</head>

<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>廠商資料新增 - addMerchant.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/merchant/images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<jsp:useBean id="merchantSvc" scope="page" class="com.merchant.model.MerchantService" />

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_endMerchantServlet" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>廠商會員帳號:</td>
		<td><input type="TEXT" name="merchant_id" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_id()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商密碼:</td>
		<td><input type="TEXT" name="merchant_pass" size="45" 
			 value="<%= (merchantVO==null)? "Joy" : merchantVO.getMerchant_pass()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商商家名稱:</td>
		<td><input type="TEXT" name="merchant_name" size="45" 
			 value="<%= (merchantVO==null)? "喬伊的家" : merchantVO.getMerchant_name()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商負責人姓名:</td>
		<td><input type="TEXT" name="merchant_pm" size="45" 
			 value="<%= (merchantVO==null)? "林喬伊" : merchantVO.getMerchant_pm()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商地址:</td>
		<td><input type="TEXT" name="merchant_add" size="45" 
			 value="<%= (merchantVO==null)? "桃園市中壢區中大路300號" : merchantVO.getMerchant_add()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商電話:</td>
		<td><input type="TEXT" name="merchant_tel" size="45" 
			 value="<%= (merchantVO==null)? "(03)4226062" : merchantVO.getMerchant_tel()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商電子郵件:</td>
		<td><input type="TEXT" name="merchant_email" size="45" 
			 value="<%= (merchantVO==null)? "ncucc@cc.ncu.edu.tw" : merchantVO.getMerchant_email()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商狀態:</td>
		<td><input type="TEXT" name="merchant_status" size="45" 
			 value="<%= (merchantVO==null)? "A1" : merchantVO.getMerchant_status()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商說明:</td>
		<td><input type="TEXT" name="merchant_ps" size="45" 
			 value="<%= (merchantVO==null)? "1915年創立至今，歷經100多年的耕耘，中央大學已成為國內少數歷史悠久、校景優美且校譽優良之頂尖大學。目前學生人數約1萬2000人，培育出許多優秀校友，為國家貢獻良多。" : merchantVO.getMerchant_ps()%>" /></td>
	</tr>
	
	<tr>
		<td>廠商圖片:</td>
		<td>
		<input type="file" id="merchant_input" accept="image/gif, image/jpeg, image/png" name="merchant_img">
	    </td>
	</tr>
	
	
	
</table>
  
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>

</body>
<script type="text/javascript">
$("#merchant_input").change(function(){
	readURL(this);
});

function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload =function(e){
			$("#merchantInput_img").attr('src', e.target.result);
		}
		reader.readAsDataURL(input,files[0]);
	}
}




</script>

</html>