package com.zumuniyo.common.dto;

import java.util.HashMap;
import java.util.Map;

public class CommonDTO {
	
	Map<String, Object> dataMap = new HashMap<String, Object>();

	public CommonDTO() {}

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	public Object getData(String key) {
		return dataMap.get(key);
	}
	
	public void setData(String key,Object value) {
		dataMap.put(key, value);
	}

}