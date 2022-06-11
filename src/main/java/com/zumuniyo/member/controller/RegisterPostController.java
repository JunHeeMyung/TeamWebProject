package com.zumuniyo.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.member.dto.MemberDTO;
import com.zumuniyo.member.model.MemberService;
import com.zumuniyo.security.dto.SecurityDTO;
import com.zumuniyo.security.model.SecurityService;
import com.zumuniyo.util.HashUtil;
import com.zumuniyo.util.RegexValidator;
import com.zumuniyo.util.RegexValidator.PatternsType;

public class RegisterPostController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		// 파라메터 획득
		
		String mem_type = request.getParameter("mem_type");
		String mem_email = request.getParameter("mem_email");
		String mem_nick = request.getParameter("mem_nick");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		// 파라메터 검증
		
		if(mem_type==null||mem_email==null||mem_nick==null||mem_id==null||mem_pw==null) {
			return "json:입력값을 재확인해주세요";
		}
		if(!mem_type.equals("일반회원")&&!mem_type.equals("사업자회원")) {
			return "json:회원분류를 재확인해주세요";
		}
		if(!RegexValidator.patternCheck(mem_nick, PatternsType.NICK_PATTERN)) {
			return "json:닉네임을 재확인해주세요";
		}
		if(!RegexValidator.patternCheck(mem_id, PatternsType.ID_PATTERN)) {
			return "json:아이디를 재확인해주세요";
		}
		if(!RegexValidator.patternCheck(mem_pw, PatternsType.PW_PATTERN)) {
			return "json:비밀번호를 재확인해주세요";
		}

		// 중복체크
		
		MemberService memberService = new MemberService();
		
		MemberDTO memberDTO = memberService.selectById(mem_id);
		if(!(memberDTO==null)) {
			return "json:사용중인 아이디입니다";
		}
		memberDTO = memberService.selectByEmail(mem_email);
		if(!(memberDTO==null)) {
			return "json:사용중인 이메일입니다";
		}
		memberDTO = memberService.selectByNick(mem_nick);
		if(!(memberDTO==null)) {
			return "json:사용중인 닉네임입니다";
		}
		
		// 보안정보 등록
		
		String salt = HashUtil.createSalt();
		String pwhash = HashUtil.createHash(mem_pw, salt,1000);
		
		memberDTO = new MemberDTO(0, mem_id, mem_nick, mem_email, salt, mem_type, null);
		memberService.insertMember(memberDTO);
		memberDTO = memberService.selectByEmail(mem_email);
		
		SecurityService securityService = new SecurityService();
		SecurityDTO securityDTO = new SecurityDTO(memberDTO.getMem_seq(),pwhash);
		securityService.insertSecurity(securityDTO);

		return "json:성공";
	}

}