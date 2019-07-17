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
     font-family: sans-serif, "微軟正黑體";
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
     font-family: sans-serif, "微軟正黑體";
     font-size:32px;
     color: #FFFFFF; 
     align-items: center;
	 text-align: center;
}


#body{
     background-color: #FFFFFF;
     padding: 5px;
     font-family: sans-serif, "微軟正黑體";
     font-size:32px;
     color: #000000; 
	 align-items: center;
	 text-align: center;     
}


#footer{
	background: #0044BB;
    padding:20px;
    clear: both;
    font-family: sans-serif, "微軟正黑體";
    color: #FFF;
	align-items: center;
	text-align: center;
}

h1{
font-family: sans-serif, "微軟正黑體";
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
	clip-path: polygon(5% 0, 95% 0, 100% 15%, 100% 85%, 95% 100%, 5% 100%, 0 85%, 0 15%);/* 六角形狀*/
    left:35%;
    top:275px;
	}

   #box11{
 	width: 900px;
    height: 350px;
    background: #009FCC;
    clip-path: polygon(5% 0, 95% 0, 100% 15%, 100% 85%, 95% 100%, 5% 100%, 0 85%, 0 15%); /* 六角形狀*/
    position:absolute;
    display:  flex;
    align-items: center;
    justify-content:  center;
	}
	
   #box12{
     position: absolute;
     left:  20%;      /* 離左邊距離*/
     top:   10%;     /* 位置高度 */
     text-align: center;
     width: 400px;      /* 照片大小 */
     border-style:solud;  
   }
   
   
   #box2{
 	width: 1000px;
    height: 330px;
    background: #CCEEFF;
    -webkit-border-radius: 50px;
    position:absolute;
    left:450px; /* 離左邊距離*/
    top:650px; /* 位置高度 */
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
     left:  1400px;      /* 離左邊距離*/
     top:   800px;     /* 位置高度 */
     text-align: center;
     width: 400px;      /* 照片大小 */
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
<h1>ASIDE 左側邊</h1>
</nav>

<body id="body">

<body>

<aside id="aside">
   <h1>ASIDE 左側邊</h1>
	<div style="left:50px">
	<a href="">廠商資料<br>
	</div>
	
	<div class="product">
		商品<br>
		<a href="">新增商品</a><br>
		<a href="">上架</a><br>
        <a href="">下架</a><br>
        <a href="">促銷</a><br>
	</div>
	
	<div class="order">
		訂單<br>
        <a href="">未出貨</a><br>
        <a href="">已出貨</a><br>
        <a href="">取消訂單區</a><br>
        <a href="">退貨區</a><br>
	</div>
	
	<div class="promotion">
		廣告<br>
		<a href="">新增廣告</a><br>
        <a href="">待審核</a><br>
        <a href="">上架</a><br>
        <a href="">下架</a><br>
	</div>
</aside>

<footer id="footer">
    <h1>FOOTER 頁尾</h1>
</footer>

</body>
</html>