package com.zumuniyo.review.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import com.zumuniyo.review.model.ReviewService;

public class ReviewSelectByMemController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("세션 생성 여부" + session.isNew());

		JSONObject jObject = new JSONObject();
		jObject = (JSONObject) session.getAttribute("member");
		if(jObject==null) {
			return "redirect:"+request.getContextPath()+"/member/login.do";
		}
				
		String mem_seq = (String) jObject.get("mem_seq");

		System.out.println("mem_seq " + mem_seq);
		ReviewService service = new ReviewService();
		
		request.setAttribute("reviewMemberList", service.selectReviewByMemSeqWithMenuName(Integer.parseInt(mem_seq)));
		
		return "/view/review/reviewMemberList.jsp";
	}

}
