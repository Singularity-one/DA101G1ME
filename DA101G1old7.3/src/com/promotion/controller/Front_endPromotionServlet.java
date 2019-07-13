package com.promotion.controller;

import java.io.*;
import java.sql.Date;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.promotion.model.PromotionService;
import com.promotion.model.PromotionVO;

@WebServlet("/Front_endPromotionServlet1")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class Front_endPromotionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
		public void doGet(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {
			doPost(req, res);
		}

		public void doPost(HttpServletRequest req, HttpServletResponse res)
				throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
			String action = req.getParameter("action");
			
			
			if ("getOne_For_Promotion".equals(action)) { // 來自front-end/promotion_select_page.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String str = req.getParameter("promotion_no");
					if (str == null || (str.trim()).length() == 0) {
						errorMsgs.add("請輸入廣告編號");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/promotion/promotion_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					String promotion_no = null;
					try {
						promotion_no = new String(str);
					} catch (Exception e) {
						errorMsgs.add("廣告編號格式不正確");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/promotion/promotion_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					/***************************2.開始查詢資料*****************************************/
					PromotionService promotionSvc = new PromotionService();
					PromotionVO promotionVO = promotionSvc.getOnePromotion(promotion_no);
					if (promotionVO == null) {
						errorMsgs.add("查無資料");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/promotion/promotion_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
					
					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					req.setAttribute("promotionVO", promotionVO); // 資料庫取出的promotionVO物件,存入req
					String url = "/front-end/promotion/listOnePromotion.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOnePromotion.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/promotion/promotion_select_page.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			if ("getOne_For_Update".equals(action)) { // 來自listAllPromotion.jsp的請求

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.接收請求參數****************************************/
					String promotion_no = new String(req.getParameter("promotion_no"));
					
					/***************************2.開始查詢資料****************************************/
					PromotionService promotionSvc = new PromotionService();
					PromotionVO promotionVO = promotionSvc.getOnePromotion(promotion_no);
									
					/***************************3.查詢完成,準備轉交(Send the Success view)************/
					req.setAttribute("promotionVO", promotionVO);         // 資料庫取出的promotionVO物件,存入req
					String url = "/front-end/promotion/update_Promotion_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_promotion_input.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/promotion/listAllPromotion.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			if ("update".equals(action)) { // 來自update_promotion_input.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String promotion_no = new String(req.getParameter("promotion_no").trim());
					
					String merchant_no = req.getParameter("merchant_no").trim();
					if (merchant_no == null || merchant_no.trim().length() == 0) {
						errorMsgs.add("廠商編號請勿空白");
					}
					
					String product_no = req.getParameter("product_no").trim();
					if (product_no == null || product_no.trim().length() == 0) {
						errorMsgs.add("商品編號請勿空白");
					}
					
					String promotion_name = req.getParameter("promotion_name").trim();
					if (promotion_name == null || promotion_name.trim().length() == 0) {
						errorMsgs.add("廣告名稱請勿空白");
					}
					
					java.sql.Date promotion_start = null;
					try {
						promotion_start = java.sql.Date.valueOf(req.getParameter("promotion_start").trim());
					} catch (IllegalArgumentException e) {
						promotion_start=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					java.sql.Date promotion_end = null;
					try {
						promotion_end = java.sql.Date.valueOf(req.getParameter("promotion_end").trim());
					} catch (IllegalArgumentException e) {
						promotion_end=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					Double promotion_pr = null;
					try {
						promotion_pr = new Double(req.getParameter("promotion_pr").trim());
					} catch (NumberFormatException e) {
						promotion_pr = 0.0;
						errorMsgs.add("折扣請填數字.");
					}
					
					String promotion_ps = req.getParameter("promotion_ps").trim();
					if (promotion_ps == null || promotion_ps.trim().length() == 0) {
						errorMsgs.add("廣告說明請勿空白");
					}
					
					String promotion_status = req.getParameter("promotion_status").trim();
					if (promotion_status == null || promotion_status.trim().length() == 0) {
						errorMsgs.add("廣告狀態請勿空白");
					}
					
					byte[] promotion_img = null;
					Collection<Part> parts = req.getParts();
					
					for (Part part : parts) {
						if (part.getContentType()!=null) {
							InputStream in = part.getInputStream();
							promotion_img = new byte[in.available()];
							in.read(promotion_img);
							in.close();
						}
					}
					

					PromotionVO promotionVO = new PromotionVO();
					promotionVO.setPromotion_no(promotion_no);
					promotionVO.setMerchant_no(merchant_no);
					promotionVO.setProduct_no(product_no);
					promotionVO.setPromotion_name(promotion_name);
					promotionVO.setPromotion_start(promotion_start);
					promotionVO.setPromotion_end(promotion_end);
					promotionVO.setPromotion_pr(promotion_pr);
					promotionVO.setPromotion_ps(promotion_ps);
					promotionVO.setPromotion_status(promotion_status);
					promotionVO.setPromotion_img(promotion_img);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("promotionVO", promotionVO); // 含有輸入格式錯誤的promotionVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/promotion/update_Promotion_input.jsp.jsp");
						failureView.forward(req, res);
						return; //程式中斷
					}
					
					/***************************2.開始修改資料*****************************************/
					PromotionService promotionSvc = new PromotionService();
					promotionVO = promotionSvc.updatePromotion(promotion_no, merchant_no, product_no, promotion_name, promotion_start,promotion_end, promotion_pr,promotion_ps, promotion_status, promotion_img);
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					req.setAttribute("promotionVO", promotionVO); // 資料庫update成功後,正確的的empVOpromotionVO物件,存入req
					String url = "/front-end/promotion/listOnePromotion.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOnePromotion.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/promotion/update_Promotion_input.jsp.jsp");
					failureView.forward(req, res);
				}
			}

	        if ("insert".equals(action)) { // 來自addPromotion.jsp的請求  
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					
					String merchant_no = req.getParameter("merchant_no").trim();
					if (merchant_no == null || merchant_no.trim().length() == 0) {
						errorMsgs.add("廠商編號請勿空白");
					}
					
					String product_no = req.getParameter("product_no").trim();
					if (product_no == null || product_no.trim().length() == 0) {
						errorMsgs.add("商品編號請勿空白");
					}
					
					String promotion_name = req.getParameter("promotion_name").trim();
					if (promotion_name == null || promotion_name.trim().length() == 0) {
						errorMsgs.add("廣告名稱請勿空白");
					}
					
					java.sql.Date promotion_start = null;
					try {
						promotion_start = java.sql.Date.valueOf(req.getParameter("promotion_start").trim());
					} catch (IllegalArgumentException e) {
						promotion_start=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					java.sql.Date promotion_end = null;
					try {
						promotion_end = java.sql.Date.valueOf(req.getParameter("promotion_end").trim());
					} catch (IllegalArgumentException e) {
						promotion_end=new java.sql.Date(System.currentTimeMillis());
						errorMsgs.add("請輸入日期!");
					}
					
					Double promotion_pr = null;
					try {
						promotion_pr = new Double(req.getParameter("promotion_pr").trim());
					} catch (NumberFormatException e) {
						promotion_pr = 0.0;
						errorMsgs.add("折扣請填數字.");
					}
					
					String promotion_ps = req.getParameter("promotion_ps").trim();
					if (promotion_ps == null || promotion_ps.trim().length() == 0) {
						errorMsgs.add("廣告說明請勿空白");
					}
					
					String promotion_status = req.getParameter("promotion_status").trim();
					if (promotion_status == null || promotion_status.trim().length() == 0) {
						errorMsgs.add("廣告狀態請勿空白");
					}
					
					byte[] promotion_img = null;
					Collection<Part> parts = req.getParts();
					
					for (Part part : parts) {
						if (part.getContentType()!=null) {
							InputStream in = part.getInputStream();
							promotion_img = new byte[in.available()];
							in.read(promotion_img);
							in.close();
						}
					}


					PromotionVO promotionVO = new PromotionVO();
					promotionVO.setMerchant_no(merchant_no);
					promotionVO.setProduct_no(product_no);
					promotionVO.setPromotion_name(promotion_name);
					promotionVO.setPromotion_start(promotion_start);
					promotionVO.setPromotion_end(promotion_end);
					promotionVO.setPromotion_pr(promotion_pr);
					promotionVO.setPromotion_ps(promotion_ps);
					promotionVO.setPromotion_status(promotion_status);
					promotionVO.setPromotion_img(promotion_img);
					

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("promotionVO", promotionVO); // 含有輸入格式錯誤的promotionVO物件,也存入req
						RequestDispatcher failureView = req
								.getRequestDispatcher("/front-end/promotion/addPromotion.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					PromotionService promotionSvc = new PromotionService();
					promotionVO = promotionSvc.addPromotion(merchant_no, product_no, promotion_name, promotion_start, promotion_end, promotion_pr, promotion_ps, promotion_status, promotion_img);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/front-end/promotion/listAllPromotion.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllPromotion.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/promotion/addPromotion.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			if ("delete".equals(action)) { // 來自listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.接收請求參數***************************************/
					String promotion_no = new String(req.getParameter("promotion_no"));
					
					/***************************2.開始刪除資料***************************************/
					PromotionService promotionSvc = new PromotionService();
					promotionSvc.deletePromotion(promotion_no);
					
					/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
					String url = "/front-end/promotion/listAllPromotion.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
					successView.forward(req, res);
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("刪除資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/promotion/listAllPromotion.jsp");
					failureView.forward(req, res);
				}
			}
		}
	}
