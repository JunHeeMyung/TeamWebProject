package com.zumuniyo.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.model.MemberService;
import com.zumuniyo.util.RegexValidator;
import com.zumuniyo.util.RegexValidator.PatternsType;

public class UpdatenickController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String mem_nick = request.getParameter("mem_nick");
		
		Map<String, String> loginInfo = (Map<String, String>)request.getSession().getAttribute("member");
		
		   if(loginInfo==null) {
	        	return "json:로그인정보가 없습니다";
	        }        
        
		int mem_seq = Integer.parseInt(loginInfo.get("mem_seq"));
		
		if(mem_nick==null||mem_nick.equals("")) {
			return "json:입력값을 확인해주세요";
		}
		if(!RegexValidator.patternCheck(mem_nick, PatternsType.NICK_PATTERN)) {
			return "json:닉네임을 재확인해주세요";
		}
		
		MemberService memberService = new MemberService();
		
		if(memberService.selectByNick(mem_nick)!=null) {
			return "json:중복된 닉네임입니다";
		};
		
		int result =memberService.updateNickBySeq(mem_nick, mem_seq);
		
		if(result<=0) {
			return "json:정보 변경에 실패했습니다.";
		}
		
		Map<String, String> memberMap = new HashMap<String, String>(); 
		memberMap.put("mem_seq",loginInfo.get("mem_seq"));
		memberMap.put("mem_nick",mem_nick);
		memberMap.put("mem_type",loginInfo.get("mem_type"));
		
		JSONObject member = new JSONObject(memberMap);
		
		request.getSession().setAttribute("member", member);
		
		return "json:성공";

	}

}
