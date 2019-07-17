package com.order_detail.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.order_detail.model.Order_detailService;
import com.order_detail.model.Order_detailVO;



@WebServlet("/Order_detailServlet1")
public class Order_detailServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		//後台單一搜尋一個訂單
		if ("getOne_For_Order_detail".equals(action)) { // 來自order_detail_select_page.jsp的請求

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
							.getRequestDispatcher("back-end/order_detail/portal.jsp");
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
							.getRequestDispatcher("back-end/order_detail/portal.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				
				/***************************2.開始查詢資料*****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				Order_detailVO order_detailVO = order_detailSvc.getOneOrder_detail(order_no);

				if (order_detailVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("back-end/order_detail/portal.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("order_detailVO", order_detailVO); // 資料庫取出的order_detailVO物件,存入req
				String url = "back-end/order_detail/portal.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder_detail.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("back-end/order_detail/portal.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllOrder_detail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String order_no = new String(req.getParameter("order_no"));
				
				/***************************2.開始查詢資料****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				Order_detailVO order_detailVO = order_detailSvc.getOneOrder_detail(order_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("order_detailVO", order_detailVO);         // 資料庫取出的order_detailVO物件,存入req
				String url = "front-end/order_detail/update_order_detail_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_order_detail_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/order_detail/listAllOrder_detail.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_merchant_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String order_no =req.getParameter("order_no");
				
				String mem_no = req.getParameter("mem_no");
				if (mem_no == null || mem_no.trim().length() == 0) {
					errorMsgs.add("會員請勿空白");
				}	
				
				String merchant_no = req.getParameter("merchant_no").trim();
				if (merchant_no == null || merchant_no.trim().length() == 0) {
					errorMsgs.add("廠商請勿空白");
				}
				
				String order_status = req.getParameter("order_status").trim();
				if (order_status == null || order_status.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				
				Integer order_amosum = new Integer(req.getParameter("order_amosum").trim());
				
				java.sql.Timestamp order_time = null;
				try {
					order_time = java.sql.Timestamp.valueOf(req.getParameter("order_time").trim());
				} catch (IllegalArgumentException e) {
					order_time=new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				String order_cusadr = req.getParameter("order_cusadr").trim();
				if (order_cusadr == null || order_cusadr.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}
				
				String order_cusname = req.getParameter("order_cusname").trim();
				if (order_cusname == null || order_cusname.trim().length() == 0) {
					errorMsgs.add("收件人姓名請勿空白");
				}
				
				String order_cusphone = req.getParameter("order_cusphone").trim();
				if (order_cusphone == null || order_cusname.trim().length() == 0) {
					errorMsgs.add("電話請勿空白");
				}
				
				Order_detailVO order_detailVO = new Order_detailVO();
				order_detailVO.setOrder_no(order_no);
				order_detailVO.setMem_no(mem_no);
				order_detailVO.setMerchant_no(merchant_no);
				order_detailVO.setOrder_status(order_status);
				order_detailVO.setOrder_amosum(order_amosum);
				order_detailVO.setOrder_time(order_time);
				order_detailVO.setOrder_cusadr(order_cusadr);
				order_detailVO.setOrder_cusname(order_cusname);
				order_detailVO.setOrder_cusphone(order_cusphone);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("order_detailVO",order_detailVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/update_order_detail_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				order_detailVO = order_detailSvc.updateOrder_detail(order_no, mem_no, merchant_no, order_status, order_amosum, order_time, order_cusadr, order_cusname,order_cusphone);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("order_detailVO", order_detailVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "front-end/order_detail/listOneOrder_detail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/order_detail/update_order_detail_input.jsp");
				failureView.forward(req, res);
			}
		}
//
//        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
//			
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
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
//
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					req.setAttribute("merchantVO", merchantVO); // 含有輸入格式錯誤的merchantVO物件,也存入req
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("front-end/merchant/addMerchant.jsp");
//					failureView.forward(req, res);
//					return;
//				}
//				
//				/***************************2.開始新增資料***************************************/
//				MerchantService merchantSvc = new MerchantService();
//				merchantVO = merchantSvc.addMerchant(merchant_id, merchant_pass, merchant_name, merchant_pm, merchant_add, merchant_tel, merchant_email, merchant_status, merchant_ps, merchant_img);
//				
//				/***************************3.新增完成,準備轉交(Send the Success view)***********/
//				String url = "front-end/merchant/listAllMerchant.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);				
//				
//				/***************************其他可能的錯誤處理**********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("front-end/merchant/addMerchant.jsp");
//				failureView.forward(req, res);
//			}
//		}
//		
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
		
		//從前台更改單一訂單出貨狀態
		if ("getOneOrder_detailStatus_Update".equals(action)) { // 來自OnlyOneOrderDetailOfMerchant.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/

				
				String order_no = new String(req.getParameter("order_no").trim());
				
				
				String order_status = req.getParameter("order_status").trim();
				if (order_status == null || order_status.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				
				Order_detailVO order_detailVO = new Order_detailVO();
				order_detailVO.setOrder_no(order_no);

				order_detailVO.setOrder_status(order_status);
			

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("order_detailVO",order_detailVO); // 含有輸入格式錯誤的order_detailVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				order_detailVO = order_detailSvc.updateOrder_detailStatus(order_no, order_status);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("order_detailVO", order_detailVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "front-end/merchant/Index/MerchantOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交OnlyOneOrderDetailOfMerchant.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		// 單一廠商查詢全部訂單單一狀態並Order_detailVO傳回list
		if ("get_OneStatus_Order_detail".equals(action)) { // 來自OnlyOneStatusOrderDetail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("order_status");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入狀態編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String order_status = null;
				try {
					order_status = new String(str);
				} catch (Exception e) {
					errorMsgs.add("狀態格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				
				String str2 = req.getParameter("merchant_no");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("請輸入廠商編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String merchant_no = null;
				try {
					merchant_no = new String(str2);
				} catch (Exception e) {
					errorMsgs.add("廠商編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}

				
				/***************************2.開始查詢資料*****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				List<Order_detailVO> list = order_detailSvc.getOneStatusOrder_detailByMerchantNo(order_status, merchant_no);

				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("List<Order_detailVO>", list); // 資料庫取出的order_detailVO物件,存入req
				String url = "front-end/merchant/Index/MerchantOrder.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder_detail.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/merchant/Index/MerchantOrder.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		//查詢一個月單一廠商有關的訂單
		if ("getOneMonth_One_Merchant".equals(action)) { // 來自OnlyOneStatusOrderDetail.jsp的請求
			
			HttpSession session = req.getSession();

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);

				try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("month");
				if (str == null || (str.trim()).length() == 0) {
							errorMsgs.add("請輸入月份");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
						.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
					return;//程式中斷
				}
						
				String month = null;
				try {
					month = new String(str);
				} catch (Exception e) {
					errorMsgs.add("月份格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
						.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
				}		
						
				String str2 = req.getParameter("merchant_no");
					if (str2 == null || (str2.trim()).length() == 0) {
						errorMsgs.add("請輸入廠商編號");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
				    }
						
					String merchant_no = null;
					try {
						merchant_no = new String(str2);
					} catch (Exception e) {
						errorMsgs.add("廠商編號格式不正確");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
							.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}

						
					/***************************2.開始查詢資料*****************************************/
					
					Order_detailService order_detailSvc = new Order_detailService();
					List<Order_detailVO> list = order_detailSvc.getOneMonthOfOneMerchantNo (month,merchant_no);

					if (list == null) {
						errorMsgs.add("查無資料");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
							.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
						
					/***************************3.查詢完成,準備轉交(Send the Success view)*************/
					session.setAttribute("month", str);
					session.setAttribute("merchant_no", str2);
					req.setAttribute("List<Order_detailVO>", list); // 資料庫取出的order_detailVO物件,存入req
					String url = "back-end/order_detail/portal.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder_detail.jsp
					successView.forward(req, res);

					/***************************其他可能的錯誤處理*************************************/
					} catch (Exception e) {
						errorMsgs.add("無法取得資料:" + e.getMessage());
						RequestDispatcher failureView = req
								.getRequestDispatcher("back-end/order_detail/order_detail_select_page.jsp");
						failureView.forward(req, res);
					}
				}
		
		
		//前台廠商輸入時間區間找當日訂單
		if ("getOrder_detail_Day".equals(action)) { // 來自OnlyOneStatusOrderDetail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				
				java.sql.Date order_time_start = null;
				try {
					order_time_start = java.sql.Date.valueOf(req.getParameter("order_time_start").trim());
					
				} catch (IllegalArgumentException e) {
					order_time_start=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				SimpleDateFormat bartDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
				String order_time_start1 = bartDateFormat1.format(order_time_start);		
				
				java.sql.Date order_time_end = null;
				
				try {
					order_time_end =java.sql.Date.valueOf(req.getParameter("order_time_end").trim());
				} catch (IllegalArgumentException e) {
					order_time_end=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入日期!");
				}
				
				 SimpleDateFormat bartDateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
				 String order_time_end1 = bartDateFormat2.format(order_time_end);

				
				 	String str = req.getParameter("merchant_no");
					if (str == null || (str.trim()).length() == 0) {
						errorMsgs.add("請輸入廠商編號");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
								.getRequestDispatcher("front-end/order_detail/order_detail.jsp");
						failureView.forward(req, res);
						return;//程式中斷
				    }
					
					String merchant_no = null;
					try {
						merchant_no = new String(str);
					} catch (Exception e) {
						errorMsgs.add("廠商編號格式不正確");
					}
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/order_detail.jsp");
						failureView.forward(req, res);
						return;//程式中斷
					}
				
				
				
				/***************************2.開始查詢資料*****************************************/
				Order_detailService order_detailSvc = new Order_detailService();
				List<Order_detailVO> list = order_detailSvc.getAllOneDayOfMerchantNo(order_time_start1,order_time_end1, merchant_no);

				if (list == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("front-end/order_detail/order_detail.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("List<Order_detailVO>", list); // 資料庫取出的order_detailVO物件,存入req
				String url = "front-end/order_detail/order_detail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder_detail.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("front-end/order_detail/order_detail.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
	}

}
