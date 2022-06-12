package com.zumuniyo.shop.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;
import com.zumuniyo.util.UploadUtil;

public class ShopInsertController implements Command{
	private static final String UPLOAD_DIR = "images";
	
	@Override
	public String execute(HttpServletRequest request) {
		
		String method = request.getMethod();
		String page = null;
		
		if(method.equals("GET")) {
						
			ShopService service = new ShopService();
			List<ShopDTO> shopDTOs = service.selectShopAll();
						
			request.setAttribute("shopDTOs", shopDTOs);
			
			System.out.println("page url="+ page);
			System.out.println("get");
			
			//page = "reviewInsert.jsp";
			page ="/view/shop/shopInsert.jsp";
		}else {
			System.out.println("post");
			
			
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
			
			
				ShopDTO shopDTO = makeShop(request);
				shopDTO.setShop_img(photos.get(0));
				ShopService service = new ShopService();
				int result = service.shopInsert(shopDTO);
				request.setAttribute("message", result>0?"리뷰등록성공":"리뷰등록실패");
				System.out.println("result: "+result);
				page ="/view/shop/result.jsp";		
			
		}
		
	
		ReviewService service = new ReviewService();
		request.setAttribute("reviewAllList", service.selectAll());
			

		return page;
	}
	
	private ShopDTO makeShop(HttpServletRequest request) {
	//'멕시카나치킨', '서울특별시 금천구 가산디지털1로 70', '2층', NULL, NULL, img경로, 공지사,
		
		ShopDTO shopDTO = new ShopDTO();
		
		String shop_name = request.getParameter("shop_name");
		String loc_addr = request.getParameter("loc_addr");
		String shop_addr_detail = request.getParameter("shop_addr_detail");
		String shop_img = request.getParameter("shop_img");
		String shop_notice = request.getParameter("shop_notice");
		
		shopDTO.setShop_name(shop_name);
		shopDTO.setLoc_addr(loc_addr);
		shopDTO.setShop_addr_detail(shop_addr_detail);
		shopDTO.setShop_img(shop_img);
		shopDTO.setShop_notice(shop_notice);
		
		return shopDTO;
	}
	
	private int readInt(HttpServletRequest request, String column)
	{
		String data = request.getParameter(column);	
		
		return Integer.parseInt(data);
			
	}
	
	private float readFloat(HttpServletRequest request, String column)
	{
		String data = request.getParameter(column);		
		return Float.parseFloat(data);
	}

	private Double readDouble(HttpServletRequest request, String column)
	{
		String data = request.getParameter(column);		
		return Double.parseDouble(data);
	}
	/*
	private Date readDate(HttpServletRequest request, String column)
	{
		String data = request.getParameter(column);		
		return DateUtil.convertToDate(data);
	}
 */
	
}