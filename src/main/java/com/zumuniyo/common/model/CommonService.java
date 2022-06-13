package com.zumuniyo.common.model;

import java.util.List;

import org.json.simple.JSONArray;

import com.zumuniyo.common.dto.CommonDTO;

public class CommonService {
	
	CommonDAO commonDAO = new CommonDAO();

	public JSONArray getJSONforQuery(String sql) {
		commonDAO.setSql(sql);
		return commonDAO.getJSON();
	}
	
	public List<CommonDTO> getDTOforQuery(String sql){
		commonDAO.setSql(sql);
		return commonDAO.getDTO();
	}

}