package com.zumuniyo.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.controller.IdcheckController;
import com.zumuniyo.member.controller.LoginController;
import com.zumuniyo.member.controller.LoginPageController;
import com.zumuniyo.member.controller.LogoutController;
import com.zumuniyo.member.controller.NickcheckController;
import com.zumuniyo.member.controller.RegisterController;
import com.zumuniyo.member.controller.RegisterPostController;
import com.zumuniyo.member.controller.SubloginController;
import com.zumuniyo.member.controller.SubregisterController;

@WebServlet("/data/*")
public class ChainDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		String method = request.getMethod();
		/* System.out.println("요청:"+uri+":"+method); */
		String page = "";
		Command command = null;
		
		if(uri.equals("/data/mapdata.do")&&method.equals("GET")) {
			command = new MapDataController();
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
