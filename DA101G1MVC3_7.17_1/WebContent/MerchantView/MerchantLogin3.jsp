<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MerchantLogin</title>

  <style>
#header{
     height: 300px;
     background-color: #425660;
     padding: 20px;
     background-image: url( '20180921000943.jpg' );
     background-size: cover;
     font-family: sans-serif, "�L�n������";
     color: #FFF;
}  
  
  
#aside{ 
  width: 300px;
  float: left;
  height: 1000px;
  background: #5599FF;
  align-items: center;
}



#nav{
     background: #003C9D;
     padding: 5px;
     font-family: sans-serif, "�L�n������";
     font-size:32px;
     color: #FFFFFF; 
     align-items: center;
	 text-align: center;
}


#body{
     background-color: #FFFFFF;
     padding: 5px;
     font-family: sans-serif, "�L�n������";
     font-size:32px;
     color: #000000; 
	 align-items: center;
	 text-align: center;     
}


#footer{
	background: #0044BB;
    padding:20px;
    clear: both;
    font-family: sans-serif, "�L�n������";
    color: #FFF;
	align-items: center;
	text-align: center;
}

h1{
font-family: sans-serif, "�L�n������";
font-size: 18px;
color: #FFF;
text-align: center;
}

a{
color: #FFF;     
}




/* try box
------------------------------------------------------------ */

   #box1{
 	width: 900px;
    height: 330px;
    background: #009FCC;
    position:absolute;
	clip-path: polygon(5% 0, 95% 0, 100% 15%, 100% 85%, 95% 100%, 5% 100%, 0 85%, 0 15%);/* �����Ϊ�*/
    left:35%;
    top:275px;
	}

   #box11{
 	width: 900px;
    height: 350px;
    background: #009FCC;
    clip-path: polygon(5% 0, 95% 0, 100% 15%, 100% 85%, 95% 100%, 5% 100%, 0 85%, 0 15%); /* �����Ϊ�*/
    position:absolute;
    display:  flex;
    align-items: center;
    justify-content:  center;
	}
	
   #box12{
     position: absolute;
     left:  20%;      /* ������Z��*/
     top:   10%;     /* ��m���� */
     text-align: center;
     width: 400px;      /* �Ӥ��j�p */
     border-style:solud;  
   }
   
   
   #box2{
 	width: 1000px;
    height: 330px;
    background: #CCEEFF;
    -webkit-border-radius: 50px;
    position:absolute;
    left:450px; /* ������Z��*/
    top:650px; /* ��m���� */
	}

   #box21{
 	width: 1000px;
    height: 350px;
    background:#CCEEFF;
    -webkit-border-radius: 50px;
    position:absolute;
    display:  flex;
    align-items: center;
    justify-content:  center;
	}
   
   #box22{
     position: absolute;
     left:  1400px;      /* ������Z��*/
     top:   800px;     /* ��m���� */
     text-align: center;
     width: 400px;      /* �Ӥ��j�p */
	 border-style:solud;
   }
   
   img{
    width: 100%;
	height: 100%;
   }
   
/* try aside
------------------------------------------------------------ */
    .product{
          width:150px;
          height:35px;
          color:#FFF6F6;
          font-size:30px;
          margin:10px;
          padding-top:5px;
          border-radius:10px;
          overflow:hidden;
          line-height: 35px;
     }

     .product:hover{
		  width:180px;
          height: 180px;
     }

     .product supan{
          font-size: 14px;
     }
	 
	.order{
          width:150px;
          height:35px;
          color:#FFF6F6;
          font-size:30px;
          margin:10px;
          padding-top:5px;
          border-radius:10px;
          overflow:hidden;
          line-height: 35px;       
     }

     .order:hover{
	      width:180px;
          height: 180px;
     }

     .order supan{
          font-size: 14px;
     }
	 
	 .promotion{
          width:150px;
          height:35px;
          color:#FFF6F6;
          font-size:30px;
          margin:10px;
          padding-top:5px;
          border-radius:10px;
          overflow:hidden;
          line-height: 35px;
     }

     .promotion:hover{
          height: 200px;
     }

     .promotion supan{
          font-size: 14px;
     }


  </style>

</head>

<nav id="nav">
<h1>ASIDE ������</h1>
</nav>

<body id="body">

<body>

<aside id="aside">
   <h1>ASIDE ������</h1>
	<div style="left:50px">
	<a href="">�t�Ӹ��<br>
	</div>
	
	<div class="product">
		�ӫ~<br>
		<a href="">�s�W�ӫ~</a><br>
		<a href="">�W�[</a><br>
        <a href="">�U�[</a><br>
        <a href="">�P�P</a><br>
	</div>
	
	<div class="order">
		�q��<br>
        <a href="">���X�f</a><br>
        <a href="">�w�X�f</a><br>
        <a href="">�����q���</a><br>
        <a href="">�h�f��</a><br>
	</div>
	
	<div class="promotion">
		�s�i<br>
		<a href="">�s�W�s�i</a><br>
        <a href="">�ݼf��</a><br>
        <a href="">�W�[</a><br>
        <a href="">�U�[</a><br>
	</div>
</aside>

<footer id="footer">
    <h1>FOOTER ����</h1>
</footer>

</body>
</html>