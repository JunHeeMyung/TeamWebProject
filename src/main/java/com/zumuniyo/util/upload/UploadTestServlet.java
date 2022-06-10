package com.zumuniyo.util.upload;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zumuniyo.util.UploadUtil;

@WebServlet("/uploadtest.do")
public class UploadTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "images";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dir = request.getServletContext().getRealPath(UPLOAD_DIR);
		System.out.println("업로드 폴더: "+dir);
		
		Map<String,Object> map = UploadUtil.uploadFile(UPLOAD_DIR, request);
		List<String> photos = (List<String>)map.get("photos");
		System.out.println("업로드 사진: "+photos);
		
		// 이후 파라메터 DB 입력
		Map<String,String> params = (Map<String,String>)map.get("params");
		for(String key:params.keySet()) {
			System.out.println(key+":"+params.get(key));
		}
	}
}
