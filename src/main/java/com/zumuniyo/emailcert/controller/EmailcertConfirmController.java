package com.zumuniyo.emailcert.controller;

import javax.servlet.http.HttpServletRequest;

import com.zumuniyo.common.Command;
import com.zumuniyo.emailcert.dto.EmailcertDTO;
import com.zumuniyo.emailcert.model.EmailcertService;

public class EmailcertConfirmController implements Command {

	@Override
	public String execute(HttpServletRequest request) {
		
		String email_addr = request.getParameter("email_addr");
		String email_certnum = request.getParameter("email_certnum");
		String email_type = "가입";
		
		if(email_addr==null||email_addr.equals("")||email_certnum==null||email_certnum.equals("")) {
			return "json:서버요청실패(공백확인)";
		}
		
		EmailcertService emailcertService = new EmailcertService();
		EmailcertDTO emailcertDTO = new EmailcertDTO();
		
		emailcertDTO.setEmail_addr(email_addr);
		emailcertDTO.setEmail_certnum(email_certnum);
		emailcertDTO.setEmail_type(email_type);
		
		boolean result = emailcertService.selectByEmailcertDTO(emailcertDTO);

		return result?"json:인증성공":"json:인증실패: 인증번호 혹은 이메일이 올바르지 않거나 만료된 번호입니다.";
	}

}
