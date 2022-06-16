package com.zumuniyo.administrator.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

/**
 * Servlet implementation class AdminSevelet
 */
@WebServlet("/admin/*")
public class AdminSevelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("프론트 서블렛 Uri = " + uri);

		String page = "";
		Command command = null;

		HttpSession session = request.getSession();

		if (session.getAttribute("member") == null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}
		
		JSONObject jObject = new JSONObject();
		jObject = (JSONObject) session.getAttribute("member");
		String mem_type = (String) jObject.get("mem_type");

		System.out.println("mem_type :" + mem_type);
		if (mem_type != null) {
			if (mem_type.equals("관리자")) {
				
				if (uri.equals("/admin/adminMember.do")) {
					command = new AdminMemberController();
				} else if (uri.equals("/admin/adminShop.do")) {
					command = new AdminShopController();
				} else if (uri.equals("/admin/adminMemStatusUpdate.do")) {
				command = new AdminMemStatusUpdate();
				} else if (uri.equals("/admin/adminStatistics.do")) {
				command = new AdminStatistics();
				}
			}
		}
		
		if (command == null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}

		System.out.println("FS_uri : " + uri);
		page = command.execute(request);

		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
