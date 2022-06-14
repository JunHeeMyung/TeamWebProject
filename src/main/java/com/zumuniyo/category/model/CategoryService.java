package com.zumuniyo.category.model;

import java.util.List;

import com.zumuniyo.category.dto.CategoryDTO;

public class CategoryService {
	
	CategoryDAO categoryDAO = new CategoryDAO();
	
	public List<CategoryDTO> selectAll() {
		return categoryDAO.selectAll();
	}

}
