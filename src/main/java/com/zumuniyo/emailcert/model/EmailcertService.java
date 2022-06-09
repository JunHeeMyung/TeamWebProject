package com.zumuniyo.emailcert.model;
import com.zumuniyo.emailcert.dto.EmailcertDTO;

public class EmailcertService {
	
	EmailcertDAO emailcertDAO = new EmailcertDAO();

	public boolean selectByEmailcertDTO(EmailcertDTO emailcert) {
		return emailcertDAO.selectByEmailcertDTO(emailcert);
	}

	public int insertEmailcert(EmailcertDTO emailcert) {
		return emailcertDAO.insertEmailcert(emailcert);
	}
	
}