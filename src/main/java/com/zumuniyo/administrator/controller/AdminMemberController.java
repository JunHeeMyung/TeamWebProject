package com.zumuniyo.administrator.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberService;


public class AdminMemberController implements Command{

	@Override
	public String execute(HttpServletRequest request) {		
		
		List<MemberDTO> memberDTOs = new ArrayList<>();
		MemberService mService = new MemberService();
		memberDTOs = mService.selectAll(); 		
		
		
		System.out.println("맴버 컨트롤러 들어옴 memberDTOs"+memberDTOs);
		
		request.setAttribute("memberDTOs", memberDTOs);		
		return "/view/admin/adminMember.jsp";
	}

}
