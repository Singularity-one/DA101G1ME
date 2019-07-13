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
<title>�t�Ӹ�Ʒs�W - addmerchant.jsp</title>

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
		 <h3>�t�Ӹ�Ʒs�W - addMerchant.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/front-end/merchant/merchant_select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/merchant/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

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

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Back_endMerchantServlet" name="form1" enctype="multipart/form-data">
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
		<td><input type="TEXT" name="merchant_status" size="45" 
			 value="<%= (merchantVO==null)? "A1" : merchantVO.getMerchant_status()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӻ���:</td>
		<td><input type="TEXT" name="merchant_ps" size="45" 
			 value="<%= (merchantVO==null)? "1915�~�Хߦܤ��A���g100�h�~���ѯСA�����j�Ǥw�����ꤺ�ּƾ��v�y�[�B�մ��u���B���A�u�}�����y�j�ǡC�ثe�ǥͤH�Ƭ�1�U2000�H�A���|�X�\�h�u�q�դ͡A����a�^�m�}�h�C" : merchantVO.getMerchant_ps()%>" /></td>
	</tr>
	
	<tr>
		<td>�t�ӹϤ�:</td>
		<td>
		<input type="file" id="merchant_input" accept="image/gif, image/jpeg, image/png" name="merchant_img">
	    </td>
	</tr>
	
	
	
</table>
  
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

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