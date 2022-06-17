package com.zumuniyo.mypage.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.mypage.controller.nickname.NickNameUpdateController;





/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/mypage/*")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("mypage 프론트 서블렛 Uri = "+uri);
		
		String page = "";
		Command command = null;
						
		HttpSession session = request.getSession();
		System.out.println("세션 생성 여부"+session.isNew());
			
		
		if(session.getAttribute("member")==null) {
			System.out.println("세션 맴버변수 못 받음");
			command = new MypageEmty();
			
			page = command.execute(request);
			
			RequestDispatcher rd;
			rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			return;
		}
		
	    JSONObject jObject = new JSONObject();
	    jObject =   (JSONObject) session.getAttribute("member");
	    String mem_type = (String) jObject.get("mem_type");
		
		System.out.println("mem_type :"+mem_type);
		String url = request.getMethod();
	
		
		if(mem_type!=null) {
			
			if(mem_type.equals("관리자")) {
				command = new MypageADMIN();
			}else if(mem_type.equals("사업자회원")) {
				command = new MypageBUSINESS();
			}else if(mem_type.equals("일반회원")) {
				command = new MYpageNOMAL();
			}else if(url.equals("/mypage/nickUpdate.do")) {
				command = new NickNameUpdateController();
			}			
		} else {
			System.out.println("mem_type 못 받음");
			command = new MypageEmty();
						
			
		}
		
				
		
		if(command==null) {
			request.getRequestDispatcher("/error").forward(request, response);
			return;
		}
		
		System.out.println("FS_mypage uri : " + uri);
		page = command.execute(request);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
    
}
       
   

