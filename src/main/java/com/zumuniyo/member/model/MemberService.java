package com.zumuniyo.member.model;

import com.zumuniyo.member.dto.MemberDTO;

public class MemberService {
	
	MemberDAO memberDAO = new MemberDAO();

	public MemberDTO selectByEmail(String email) {
		return memberDAO.selectByEmail(email);
	}
	
	public MemberDTO selectByNick(String nick) {
		return memberDAO.selectByNick(nick);
	}
	
	public MemberDTO selectById(String id) {
		return memberDAO.selectById(id);
	}
	
	
	
	
	
	
}