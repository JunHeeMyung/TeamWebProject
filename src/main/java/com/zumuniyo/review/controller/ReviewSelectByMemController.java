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
		String mem_type = (String) jObject.get("mem_seq");

		System.out.println("mem_type " + mem_type);
		ReviewService service = new ReviewService();

		request.setAttribute("reviewMemberList", service.selectByMemSeq(Integer.parseInt(mem_type)));
		return "/view/review/reviewMemberList.jsp";
	}

}
