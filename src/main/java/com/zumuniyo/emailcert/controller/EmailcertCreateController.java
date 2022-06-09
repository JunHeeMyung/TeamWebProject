package com.zumuniyo.emailcert.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.emailcert.dto.EmailcertDTO;
import com.zumuniyo.emailcert.model.EmailcertService;
import com.zumuniyo.util.MailSender;
import com.zumuniyo.util.RandomUtil;

public class EmailcertCreateController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String email_addr = request.getParameter("email_addr");
		String email_certnum = RandomUtil.createRandomSixDigits();
		String email_type = "가입";
		
		if(email_addr==null||email_addr.equals("")) {
			return "json:서버요청실패";
		}
		
		EmailcertService emailcertService = new EmailcertService();
		EmailcertDTO emailcertDTO = new EmailcertDTO();
		
		emailcertDTO.setEmail_addr(email_addr);
		emailcertDTO.setEmail_certnum(email_certnum);
		emailcertDTO.setEmail_type(email_type);
		
		int result = emailcertService.insertEmailcert(emailcertDTO);
		
		if(result>0) {
			boolean mailResult = new MailSender("ZUMUNIYO 이메일인증 시스템", "llk22@naver.com", email_addr, "[ZUMUNIYO] 인증번호입니다", "인증번호:"+email_certnum).sendMail();
			return mailResult?"json:메일발송성공":"json:메일발송실패";
		}else {
			return "json:서버요청실패";
		}
	}

}