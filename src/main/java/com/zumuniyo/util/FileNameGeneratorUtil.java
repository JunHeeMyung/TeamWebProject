package com.zumuniyo.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FileNameGeneratorUtil {

	private FileNameGeneratorUtil() {}
	
	static String generate(String fileName) {
		
		String extension =  fileName.indexOf(".")>=0?fileName.substring(fileName.lastIndexOf(".")+1):"";
		String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
		StringBuilder random = new StringBuilder("");
		for(int i=0;i<100;i++) {
			random.append(((int)(Math.random()*10)));
		}
		return date+random+extension;
	}	
}