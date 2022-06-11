package com.zumuniyo.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberDAO;
import com.zumuniyo.security.model.SecurityService;
import com.zumuniyo.util.HashUtil;

public class LoginController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		// 파라메터 획득
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		// 파라메터 검증
		
		if(mem_id==null||mem_pw==null||mem_id.equals("")||mem_pw.equals("")) {
			return "json:아이디와 비밀번호를 입력해주세요";
		}
		
		// 아이디 확인
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.selectById(mem_id);
		
		if(memberDTO==null) {
			return "json:아이디 또는 비밀번호가 다릅니다.";
		}
		
		// 비밀번호 확인
		
		int mem_seq = memberDTO.getMem_seq();
		String mem_salt = memberDTO.getMem_salt();
		String mem_nick = memberDTO.getMem_nick();
		String mem_type = memberDTO.getMem_type();
		String mem_pwhash = HashUtil.createHash(mem_pw, mem_salt,1000);
		
		SecurityService securityService = new SecurityService();
		String sec_hash = securityService.selectHashByMemSeq(mem_seq);
		
		if(mem_pwhash.equals(sec_hash)) {
			
			// 세션등록 (JSON)
			
			HttpSession session = request.getSession();
			Map<String, String> memberMap = new HashMap<String, String>(); 
			memberMap.put("mem_seq",""+mem_seq);
			memberMap.put("mem_nick",mem_nick);
			memberMap.put("mem_type",mem_type);
			
			JSONObject member = new JSONObject(memberMap);
			
			session.setAttribute("member",member); // type 제한없이 자체를 저장가능
			
			return "json:로그인성공";
		}else {
			return "json:아이디 또는 비밀번호가 다릅니다.";
		}
	}

}
