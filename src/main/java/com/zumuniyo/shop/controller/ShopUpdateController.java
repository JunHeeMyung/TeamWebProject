package com.zumuniyo.shop.controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.zumuniyo.category.dto.CategoryDTO;
import com.zumuniyo.category.model.CategoryService;
import com.zumuniyo.location.dto.LocationDTO;
import com.zumuniyo.location.model.LocationService;
import com.zumuniyo.review.dto.ReviewDTO;
import com.zumuniyo.review.model.ReviewService;
import com.zumuniyo.shop.dto.ShopDTO;
import com.zumuniyo.shop.model.ShopService;
import com.zumuniyo.util.UploadUtil;

public class ShopUpdateController implements Command{
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
			
			CategoryService categoryService = new CategoryService();
			List<CategoryDTO> categoryDTOs = categoryService.selectAll();
			
			System.out.println(categoryDTOs);
			
			
			JSONArray jsonarray = new JSONArray();
			
			for(CategoryDTO categoryDTO: categoryDTOs) {
				JSONObject jsonobject = new JSONObject();
				jsonobject.put("category_code", categoryDTO.getCategory_code());
				jsonobject.put("category_name", categoryDTO.getCategory_name());
				jsonarray.add(jsonobject);
			}
			
			request.setAttribute("categoryDTOs", jsonarray);
			
			page ="/view/shop/shopUpdate.jsp";
			
		}else {
			System.out.println("post");
			
			
			Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
			
			  if(loginInfo==null) { return "json:로그인정보가 없습니다"; }
			
			
		    int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));
			
			
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
				int result = service.shopUpdate(shopDTO);
				request.setAttribute("message", result>0?"매장수정성공":"매장수정실패");
				System.out.println("result: "+result);
				page ="/index.jsp";		
			
		}
		
		/*
		 * ReviewService service = new ReviewService();
		 * request.setAttribute("reviewAllList", service.selectAll());
		 */
			

		return page;
	}
	
	private ShopDTO makeShop(HttpServletRequest request) {
	//'멕시카나치킨', '서울특별시 금천구 가산디지털1로 70', '2층', NULL, NULL, img경로, 공지사,
		
		ShopDTO shopDTO = new ShopDTO();
		
		String shop_name = request.getParameter("shop_name");		
		
		
		String loc_addr = request.getParameter("loc_addr");
		Double loc_lat = Double.parseDouble(request.getParameter("loc_lat"));
		Double loc_lon = Double.parseDouble(request.getParameter("loc_lon"));

		String shop_addr_detail = request.getParameter("shop_addr_detail");
		
		LocationService locationServicenew = new LocationService();
		if(locationServicenew.selectByAddr(loc_addr)==null) {
			LocationDTO locationDTO = new LocationDTO(); 
			locationDTO.setLoc_addr(loc_addr);
			locationDTO.setLoc_lat(loc_lat);
			locationDTO.setLoc_lon(loc_lon);
			
			int result = locationServicenew.insertLocation(locationDTO);

			
		}
		
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");		
	    int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));

		String category_code = request.getParameter("category_code");
		String shop_img = request.getParameter("shop_img");
		String shop_notice = request.getParameter("shop_notice");
		shopDTO.setMem_seq(mem_seq);
		shopDTO.setCategory_code(category_code);
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