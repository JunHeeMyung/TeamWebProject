package com.zumuniyo.location.model;

import com.zumuniyo.location.dto.LocationDTO;

public class LocationService {
	
	LocationDAO locationDAO = new LocationDAO();
	
	public LocationDTO selectByAddr(String addr) {
		return locationDAO.selectByAddr(addr);
	}
	
	public int insertLocation(LocationDTO location) {
		return locationDAO.insertLocation(location);
	}
	

}
