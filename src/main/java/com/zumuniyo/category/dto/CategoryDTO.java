package com.zumuniyo.category.dto;

public class CategoryDTO {

	private String category_code;
	private String category_name;
	
	public CategoryDTO() {}

	public CategoryDTO(String category_code, String category_name) {
		
		this.category_code = category_code;
		this.category_name = category_name;
	}

	public String getCategory_code() {
		return category_code;
	}

	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CategoryDTO [category_code=").append(category_code).append(", category_name=")
				.append(category_name).append("]");
		return builder.toString();
	}

}
