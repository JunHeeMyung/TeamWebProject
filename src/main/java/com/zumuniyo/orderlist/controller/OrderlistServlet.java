package com.zumuniyo.orderlist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.common.Command;

@WebServlet("/orderlist/*")
public class OrderlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String method = request.getMethod();
		/* System.out.println("요청:"+uri+":"+method); */
		String page = "";
		Command command = null;
		
		if(uri.equals("/orderlist/order.do")&&method.equals("POST")) {
			command = new OrderController();
		}else if(uri.equals("/orderlist/orderdetail.do")&&method.equals("GET")) {
			command = new OrderDetailController();
		}else if(uri.equals("/orderlist/myorderlist.do")&&method.equals("GET")) {
			command = new MyOrderListController();
		}else if(uri.equals("/orderlist/manageropener.do")&&method.equals("GET")) {
			command = new ManagerOpenerController();
		}else if(uri.equals("/orderlist/orderlistmanager.do")&&method.equals("GET")) {
			command = new OrderlistManagerController();
		}else if(uri.equals("/orderlist/shoporderlist.do")&&method.equals("GET")) {
			command = new ShopOrderlistController();
		}else if(uri.equals("/orderlist/updatestatus.do")&&method.equals("POST")) {
			command = new OrderlistUpdateController();
		}

		
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}
		
		page = command.execute(request);
		
		if(page.indexOf("json:")>=0) {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(page.substring(5));
		}else if(page.indexOf("redirect:")>=0){
			response.sendRedirect(page.substring(9));
		}else {
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

}
