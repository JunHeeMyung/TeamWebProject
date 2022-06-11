package com.zumuniyo.member.model;

import java.util.List;

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
	
	public int insertMember(MemberDTO memberDTO) {
		return memberDAO.insertMember(memberDTO);
	}
	
	public int updateNickBySeq(String nick,int mem_seq) {
		return memberDAO.updateNickBySeq(nick, mem_seq);
	}
	
	public int updateStatusBySeq(String status,int mem_seq) {
		return memberDAO.updateStatusBySeq(status, mem_seq);
	}
	
	public List<MemberDTO> selectAll() {
		return memberDAO.selectAll();
	}

}