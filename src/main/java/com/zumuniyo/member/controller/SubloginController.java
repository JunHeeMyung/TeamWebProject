package com.zumuniyo.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberDAO;

public class SubloginController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		// 파라메터 획득
		
		String mem_id = request.getParameter("mem_id");
		String mem_email = request.getParameter("mem_email");
		
		// 컬백 요청
		
		if(mem_id==null&&mem_email==null) {
			return "/view/sublogin/naver/callback.jsp";
		}
		
		// 토큰 확인
		
		HttpSession session = request.getSession();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = memberDAO.selectById(mem_id);
		
		if(memberDTO!=null) {
			
			// 세션등록 (JSON)
			
			int mem_seq = memberDTO.getMem_seq();
			String mem_nick = memberDTO.getMem_nick();
			String mem_type = memberDTO.getMem_type();
			
			Map<String, String> memberMap = new HashMap<String, String>(); 
			memberMap.put("mem_seq",""+mem_seq);
			memberMap.put("mem_nick",mem_nick);
			memberMap.put("mem_type",mem_type);
			
			JSONObject member = new JSONObject(memberMap);
			
			session.setAttribute("member",member);
			
			// 경로설정
			String nextpage = (String)session.getAttribute("nextpage");
			if(nextpage==null||nextpage.equals("")) {
				// 이동할 경로가 없으면 메인으로
				return "redirect:"+request.getContextPath()+"/";
			}else {
				// 이동할 경로가 있으면 해당경로로
				return "redirect:"+request.getContextPath()+nextpage;
			}
			
		}else {
			// 토큰이 일치하지 않는경우 가입으로
			return "/member/login/subregister.do";
		}
	}
}
