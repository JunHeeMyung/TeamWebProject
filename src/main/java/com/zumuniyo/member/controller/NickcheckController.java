package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberService;

public class NickcheckController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String mem_nick = request.getParameter("mem_nick");
		if(mem_nick==null||mem_nick.equals("")) {
			return "json:닉네임을 입력해해주세요";
		}
		
		MemberService memberService = new MemberService();
		MemberDTO memberDTO = memberService.selectByNick(mem_nick);
		return memberDTO==null?"json:비중복":"json:중복";
	}
}
