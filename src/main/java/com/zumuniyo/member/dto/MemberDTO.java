package com.zumuniyo.member.dto;

public class MemberDTO {

	private int mem_seq;
	private String mem_id;
	private String mem_nick;
	private String mem_email;
	private String mem_salt;
	private String mem_type;
	private String mem_status;

	public MemberDTO() {}

	public MemberDTO(int mem_seq, String mem_id, String mem_nick, String mem_email, String mem_salt, String mem_type,
			String mem_status) {
		this.mem_seq = mem_seq;
		this.mem_id = mem_id;
		this.mem_nick = mem_nick;
		this.mem_email = mem_email;
		this.mem_salt = mem_salt;
		this.mem_type = mem_type;
		this.mem_status = mem_status;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_nick() {
		return mem_nick;
	}

	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_salt() {
		return mem_salt;
	}

	public void setMem_salt(String mem_salt) {
		this.mem_salt = mem_salt;
	}

	public String getMem_type() {
		return mem_type;
	}

	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

	public String getMem_status() {
		return mem_status;
	}

	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberDTO [mem_seq=").append(mem_seq).append(", mem_id=").append(mem_id).append(", mem_nick=")
				.append(mem_nick).append(", mem_email=").append(mem_email).append(", mem_salt=").append(mem_salt)
				.append(", mem_type=").append(mem_type).append(", mem_status=").append(mem_status).append("]");
		return builder.toString();
	}

}
