package com.zumuniyo.emailcert.dto;

import java.util.Date;

public class EmailcertDTO {
	
	private String email_addr;
	private String email_certnum;
	private Date email_date;
	private String email_type;
	
	public EmailcertDTO() {}

	public EmailcertDTO(String email_addr, String email_certnum, Date email_date, String email_type) {
		this.email_addr = email_addr;
		this.email_certnum = email_certnum;
		this.email_date = email_date;
		this.email_type = email_type;
	}

	public String getEmail_addr() {
		return email_addr;
	}

	public void setEmail_addr(String email_addr) {
		this.email_addr = email_addr;
	}

	public String getEmail_certnum() {
		return email_certnum;
	}

	public void setEmail_certnum(String email_certnum) {
		this.email_certnum = email_certnum;
	}

	public Date getEmail_date() {
		return email_date;
	}

	public void setEmail_date(Date email_date) {
		this.email_date = email_date;
	}

	public String getEmail_type() {
		return email_type;
	}

	public void setEmail_type(String email_type) {
		this.email_type = email_type;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("EmailcertDTO [email_addr=").append(email_addr).append(", email_certnum=").append(email_certnum)
				.append(", email_date=").append(email_date).append(", email_type=").append(email_type).append("]");
		return builder.toString();
	}

}
