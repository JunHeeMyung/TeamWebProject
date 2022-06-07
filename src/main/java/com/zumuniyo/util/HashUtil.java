package com.zumuniyo.util;

import java.math.BigInteger;
import java.security.*;
import java.util.Base64;

public class HashUtil {

	private HashUtil() {};

	static public String createSalt() {

		SecureRandom sr;
		byte[] bytes = new byte[32];

		try {
			sr = SecureRandom.getInstance("SHA1PRNG");
			sr.nextBytes(bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return new String(Base64.getEncoder().encode(bytes));
	}

	static public String createHash(String plaintext, String salt,int count) {

		byte[] bytes = (plaintext + salt).getBytes();
		String result = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			while(count-->0) {
				md.update(bytes);
			}
			result = String.format("%064x", new BigInteger(1, md.digest()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
