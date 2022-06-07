package com.zumuniyo.util;

import java.io.FileReader;
import java.util.Properties;

public class DBProperties {

	private static String route = "src/main/webapp/WEB-INF/DB.properties";
	private static Properties pro = new Properties();
	
	static {
		try (FileReader fr = new FileReader(route)) {
			pro.load(fr);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static final String USERID = pro.getProperty("userid");
	public static final String PASSWROD = pro.getProperty("password");
	public static final String DRIVER = pro.getProperty("driver");
	public static final String URL = pro.getProperty("url");
	
	private DBProperties() {}

}