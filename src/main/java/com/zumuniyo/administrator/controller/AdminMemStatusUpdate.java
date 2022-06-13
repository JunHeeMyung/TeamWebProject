package com.zumuniyo.administrator.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.member.model.MemberService;

public class AdminMemStatusUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		MemberService mService = new MemberService();
		
		System.out.println("mem_status "+request.getParameter("mem_status"));
		System.out.println("mem_seq "+request.getParameter("mem_seq"));
		System.out.println("mem_nick "+request.getParameter("mem_nick"));
		
		int mem_seq = Integer.parseInt(request.getParameter("mem_seq"));
		
		mService.updateStatusBySeq(request.getParameter("mem_status"), mem_seq);
		mService.updateNickBySeq(request.getParameter("mem_nick"), mem_seq);
	
		
		return "/admin/adminMember.do";
	}

}
