package com.zumuniyo.mypage.controller.nickname;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.member.model.MemberService;
import com.zumuniyo.mypage.controller.Command;

public class NickNameUpdateController implements Command {

	@Override
	public String execute(HttpServletRequest request) {		
		
		String mem_nick = (String) request.getAttribute("mem_nick");
		String mem_seq = (String) request.getAttribute("mem_seq");
		
		System.out.println("mem_nick "+ mem_nick);
		System.out.println("mem_seq "+ mem_seq);
		
		
		MemberService service = new MemberService();
		int result = service.updateNickBySeq(mem_nick, Integer.parseInt(mem_seq));		
		
		return result<=0?"json:닉네임변경 실패":"json:닉네임변경 성공";
	}

}
