package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberService;

public class IdcheckController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String mem_id = request.getParameter("mem_id");
		
		if(mem_id==null||mem_id.equals("")) {
			return "json:아이디를 입력해해주세요";
		}
		
		MemberService memberService = new MemberService();
		MemberDTO memberDTO = memberService.selectById(mem_id);
		return memberDTO==null?"json:비중복":"json:중복";
	}

}
