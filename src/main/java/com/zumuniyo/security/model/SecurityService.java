package com.zumuniyo.security.model;

import com.zumuniyo.security.dto.SecurityDTO;

public class SecurityService {

	SecurityDAO securityDAO = new SecurityDAO();
	
	public String selectHashByMemSeq(String mem_seq) {
		return securityDAO.selectHashByMemSeq(mem_seq);
	}
	
	public int insertSecurity(SecurityDTO securityDTO) {
		return securityDAO.insertSecurity(securityDTO);
	}
	
	public int updateSecurity(SecurityDTO securityDTO) {
		return securityDAO.updateSecurity(securityDTO);
	}

}
