package com.order_list.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.merchant.model.MerchantService;
import com.merchant.model.MerchantVO;
import com.order_list.model.Order_listService;
import com.order_list.model.Order_listVO;
import com.promotion.model.PromotionVO;


@WebServlet("/Order_listServlet1")
public class Order_listServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Order_list".equals(action)) { // 來自Order_list_select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("order_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String str1 = req.getParameter("product_no");
				if (str1 == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				String order_no = null;
				try {
					order_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String product_no = null;
				try {
					product_no = new String(str1);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
			
				
				/***************************2.開始查詢資料*****************************************/
				Order_listService order_listSvc = new Order_listService();
				Order_listVO order_listVO = order_listSvc.getOneOrder_list(order_no,product_no);

				if (order_listVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("order_listVO", order_listVO); // 資料庫取出的order_listVO物件,存入req
				String url = "front-end/order_list/listOneOrder_list.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOrder_list.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/order_list/order_list_select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
//		if ("getOne_For_Update".equals(action)) { // 來自listAllMerchant.jsp的請求
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.接收請求參數****************************************/
//				String merchant_no = new String(req.getParameter("merchant_no"));
//				
//				/***************************2.開始查詢資料****************************************/
//				MerchantService merchantSvc = new MerchantService();
//				MerchantVO merchantVO = merchantSvc.getOneMerchant(merchant_no);
//								
//				/***************************3.查詢完成,準備轉交(Send the Success view)************/
//				req.setAttribute("merchantVO", merchantVO);         // 資料庫取出的merchantVO物件,存入req
//				String url = "front-end/merchant/update_merchant_input.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_merchant_input.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("front-end/merchant/listAllMerchant.jsp");
//				failureView.forward(req, res);
//			}
//		}
//		
//		
//		if ("update".equals(action)) { // 來自update_merchant_input.jsp的請求
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//		
//			try {
//				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
//				
//				String merchant_no = new String(req.getParameter("merchant_no"));
//				
//				String merchant_id = req.getParameter("merchant_id");
//				String merchant_idReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (merchant_id == null || merchant_id.trim().length() == 0) {
//					errorMsgs.add("廠商帳號: 請勿空白");
//				} else if(!merchant_id.trim().matches(merchant_idReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("廠商帳號: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String merchant_pass = req.getParameter("merchant_pass");
//				String merchant_passReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (merchant_pass == null || merchant_pass.trim().length() == 0) {
//					errorMsgs.add("廠商帳號密碼: 請勿空白");
//				} else if(!merchant_pass.trim().matches(merchant_passReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("廠商帳號密碼: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String merchant_name = req.getParameter("merchant_name");
//				String merchant_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (merchant_name == null || merchant_name.trim().length() == 0) {
//					errorMsgs.add("廠商商家名稱: 請勿空白");
//				} else if(!merchant_name.trim().matches(merchant_nameReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("廠商商家名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String merchant_pm = req.getParameter("merchant_pm");
//				String merchant_pmReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
//				if (merchant_pm == null || merchant_pm.trim().length() == 0) {
//					errorMsgs.add("廠商負責人姓名: 請勿空白");
//				} else if(!merchant_pm.trim().matches(merchant_pmReg)) { //以下練習正則(規)表示式(regular-expression)
//					errorMsgs.add("廠商負責人姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
//	            }
//				
//				String merchant_add = req.getParameter("merchant_add").trim();
//				if (merchant_add == null || merchant_add.trim().length() == 0) {
//					errorMsgs.add("地址請勿空白");
//				}
//				
//				String merchant_tel = req.getParameter("merchant_tel").trim();
//				if (merchant_tel == null || merchant_tel.trim().length() == 0) {
//					errorMsgs.add("廠商電話請勿空白");
//				}
//				
//				String merchant_email = req.getParameter("merchant_email").trim();
//				if (merchant_email == null || merchant_email.trim().length() == 0) {
//					errorMsgs.add("廠商電子郵件請勿空白");
//				}
//				
//				String merchant_status = req.getParameter("merchant_status").trim();
//				if (merchant_status == null || merchant_status.trim().length() == 0) {
//					errorMsgs.add("廠商狀態請勿空白");
//				}
//				
//				String merchant_ps = req.getParameter("merchant_ps").trim();
//				if (merchant_ps == null || merchant_ps.trim().length() == 0) {
//					errorMsgs.add("廠商說明請勿空白");
//				}
//				
//				byte[] merchant_img = null;
//				Collection<Part> parts = req.getParts();
//				
//				for (Part part : parts) {
//					if (part.getContentType()!=null) {
//						InputStream in = part.getInputStream();
//						merchant_img = new byte[in.available()];
//						in.read(merchant_img);
//						in.close();
//					}
//				}
//				
//				
//
//				MerchantVO merchantVO = new MerchantVO();
//				merchantVO.setMerchant_no(merchant_no);
//				merchantVO.setMerchant_id(merchant_id);
//				merchantVO.setMerchant_pass(merchant_pass);
//				merchantVO.setMerchant_name(merchant_name);
//				merchantVO.setMerchant_pm(merchant_pm);
//				merchantVO.setMerchant_add(merchant_add);
//				merchantVO.setMerchant_tel(merchant_tel);
//				merchantVO.setMerchant_email(merchant_email);
//				merchantVO.setMerchant_status(merchant_status);
//				merchantVO.setMerchant_ps(merchant_ps);
//				merchantVO.setMerchant_img(merchant_img);
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("merchantVO", merchantVO); // 含有輸入格式錯誤的merchantVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("front-end/merchant/update_merchant_input.jsp");
//					failureView.forward(req, res);
//					return; //程式中斷
//				}
//				
//				/***************************2.開始修改資料*****************************************/
//				MerchantService merchantSvc = new MerchantService();
//				merchantVO = merchantSvc.updateMerchant(merchant_no,  merchant_id, merchant_pass, merchant_name,
//						 merchant_pm, merchant_add, merchant_tel, merchant_email, merchant_status, merchant_ps, merchant_img);
//				
//				/***************************3.修改完成,準備轉交(Send the Success view)*************/
//				req.setAttribute("merchantVO", merchantVO); // 資料庫update成功後,正確的的merchantVO物件,存入req
//				String url = "front-end/merchant/listOneMerchant.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneMerchant.jsp
//				successView.forward(req, res);
//
//				/***************************其他可能的錯誤處理*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("修改資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("front-end/merchant/update_merchant_input.jsp");
//				failureView.forward(req, res);
//			}
//		}
//

		
//		if ("delete".equals(action)) { // 來自listAllEmp.jsp
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//	
//			try {
//				/***************************1.接收請求參數***************************************/
//				String merchant_no = new String(req.getParameter("merchant_no"));
//				
//				/***************************2.開始刪除資料***************************************/
//				MerchantService merchantSvc = new MerchantService();
//				merchantSvc.deleteMerchant(merchant_no);
//				
//				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
//				String url = "front-end/merchant/listAllMerchant.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
//				successView.forward(req, res);
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("front-end/merchant/listAllMerchant.jsp");
//				failureView.forward(req, res);
//			}
//		}
		
		
		if ("getOne_For_UpdateFromOrder_detail".equals(action)) { // 來自OnlyOneOrderDetailOfMerchant.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			
			
			

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("order_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/OnlyOneOrderDetailOfMerchant.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				
				String order_no = null;
				try {
					order_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/OnlyOneOrderDetailOfMerchant.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				/***************************2.開始查詢資料*****************************************/
				Order_listService order_listSvc = new Order_listService();
				List<Order_listVO> list = order_listSvc.findOneOrder_listByOrder_no(order_no);

				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/OnlyOneOrderDetailOfMerchant.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("List<Order_listVO>", list); // 資料庫取出的order_listVO物件,存入req
				String url = "front-end/order_list/listOnlyOneOrder_list.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOrder_list.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/order_detail/OnlyOneOrderDetailOfMerchant.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}
}

