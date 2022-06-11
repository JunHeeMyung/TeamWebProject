package com.zumuniyo.security.dto;

public class SecurityDTO {
	
	private int mem_seq;
	private String sec_hash;
	
	public SecurityDTO() {}

	public SecurityDTO(int mem_seq, String sec_hash) {
		this.mem_seq = mem_seq;
		this.sec_hash = sec_hash;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
	}

	public String getSec_hash() {
		return sec_hash;
	}

	public void setSec_hash(String sec_hash) {
		this.sec_hash = sec_hash;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SecurityDTO [mem_seq=").append(mem_seq).append(", sec_hash=").append(sec_hash).append("]");
		return builder.toString();
	}
	
}
