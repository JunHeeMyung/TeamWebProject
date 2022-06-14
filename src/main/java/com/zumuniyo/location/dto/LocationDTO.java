package com.zumuniyo.location.dto;

public class LocationDTO {
	
	private String loc_addr;
	private Double loc_lat;
	private Double loc_lon;
	
	public LocationDTO() {

	}

	public LocationDTO(String loc_addr, Double loc_lat, Double loc_lon) {
	
		this.loc_addr = loc_addr;
		this.loc_lat = loc_lat;
		this.loc_lon = loc_lon;
	}

	public String getLoc_addr() {
		return loc_addr;
	}

	public void setLoc_addr(String loc_addr) {
		this.loc_addr = loc_addr;
	}

	public Double getLoc_lat() {
		return loc_lat;
	}

	public void setLoc_lat(Double loc_lat) {
		this.loc_lat = loc_lat;
	}

	public Double getLoc_lon() {
		return loc_lon;
	}

	public void setLoc_lon(Double loc_lon) {
		this.loc_lon = loc_lon;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LocationDTO [loc_addr=").append(loc_addr).append(", loc_lat=").append(loc_lat)
				.append(", loc_lon=").append(loc_lon).append("]");
		return builder.toString();
	}


}
