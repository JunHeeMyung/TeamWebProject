package com.zumuniyo.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.zumuniyo.util.QRCodeUtil;

@WebServlet("/qrcode/create.do")
public class QRCodeCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = request.getParameter("url");
		
		if(url!=null && !url.equals("")) {
			response.setContentType("image/png");
			BufferedImage qrCode = new QRCodeUtil().createQRCode(url);
			ImageIO.write(qrCode, "png", response.getOutputStream());
		}else {
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write("URL을 다시 확인해주세요");
		}
	}
}