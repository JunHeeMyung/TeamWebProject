package com.zumuniyo.util;

public class RandomUtil {
	
	private RandomUtil() {};
	
	public static String createRandomSixDigits() {
		return String.format("%06d", (int)(Math.random()*1000000));
	}
}