package com.mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mem.model.MemberService;
import com.mem.model.MemberVO;
import com.merchant.model.MerchantService;
import com.merchant.model.MerchantVO;

@WebServlet("/MemberLogin1")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	   //【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	   //【實際上應至資料庫搜尋比對】
	  protected boolean allowUser(String account, String password) {
	    if ("MB00006".equals(account) && "MB00006".equals(password))
	      return true;
	    else
	      return false;
	  }
	  
	  public void doPost(HttpServletRequest req, HttpServletResponse res)
	                                throws ServletException, IOException {
	    req.setCharacterEncoding("Big5");
	    res.setContentType("text/html; charset=Big5");
	    PrintWriter out = res.getWriter();

	    // 【取得使用者 帳號(account) 密碼(password)】
	    String account = req.getParameter("account");
	    String password = req.getParameter("password");

	    // 【檢查該帳號 , 密碼是否有效】
	    if (!allowUser(account, password)) {          //【帳號 , 密碼無效時】
	      out.println("<HTML><HEAD><TITLE>Access Denied</TITLE></HEAD>");
	      out.println("<BODY>你的帳號 , 密碼無效!<BR>");
	      out.println("請按此重新登入 <A HREF="+req.getContextPath()+"/login.html>重新登入</A>");
	      out.println("</BODY></HTML>");
	    }else {                                       //【帳號 , 密碼有效時, 才做以下工作】
	      HttpSession session = req.getSession();
	      session.setAttribute("mem_no", account);   //*工作1: 才在session內做已經登入過的標識
	      
	       try {                                                        
	         String location = (String) session.getAttribute("location");
	         if (location != null) {
	           session.removeAttribute("location");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
	           res.sendRedirect(location);            
	           return;
	         }
	       }catch (Exception ignored) { }

	      res.sendRedirect(req.getContextPath()+"/MerchantView/MerchantLogin4.jsp");  //*工作3: (-->如無來源網頁:則重導至login_success.jsp)
	    }
	  }
	}