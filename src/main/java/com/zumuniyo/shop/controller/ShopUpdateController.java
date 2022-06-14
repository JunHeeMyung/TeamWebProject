package com.zumuniyo.shop.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;
import com.zumuniyo.util.UploadUtil;

public class ShopUpdateController implements Command{
	private static final String UPLOAD_DIR = "images";
	
	@Override
	public String execute(HttpServletRequest request) {

		/*
		
		String method = request.getMethod();
		String page = null;
		
		if(method.equals("GET")) {
						
			ShopService service = new ShopService();
			List<ShopDTO> shopDTOs = service.selectShopAll();
						
			request.setAttribute("shopDTOs", shopDTOs);
			
			System.out.println("page url="+ page);
			System.out.println("get");
			
			//page = "reviewInsert.jsp";
			page ="/view/shop/shopUpdate.jsp";
		}else {
			System.out.println("post");
			
			
			String dir = request.getServletContext().getRealPath(UPLOAD_DIR);
			System.out.println("업로드 폴더: "+dir);
			
			Map<String,Object> map = UploadUtil.uploadFile(UPLOAD_DIR, request);
			List<String> photos = (List<String>)map.get("photos");
			System.out.println("업로드 사진: "+photos);
			
		
			int shop_seq = Integer.parseInt(request.getParameter("shop_seq"));
			String shop_name= request.getParameter("shop_name");
			String shop_addr = request.getParameter("shop_addr");
			String shop_addr_detail= request.getParameter("shop_addr_detail");
			String shop_img= request.getParameter("shop_img");
			String shop_notice= request.getParameter("shop_notice");
		
			ShopDTO shop = new ShopDTO(shop_seq, shop_name, shop_addr, shop_addr_detail, null, null, shop_img, 0, null);
			ShopService service = new ShopService();
			int result = service.shopUpdate(board);
			String message = "수정실패";
			if(result>0) {message = "수정성공";
			request.setAttribute("message", message);
			RequestDispatcher rd;
			rd = request.getRequestDispatcher("result.jsp");
			rd.forward(request, response);	
			}
		}
		*/

		return null;
	}

}
