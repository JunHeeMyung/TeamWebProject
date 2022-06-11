package com.zumuniyo.util;

import java.util.regex.Pattern;

public class RegexValidator {

	public static enum PatternsType {
		
		// 아이디 : 영문시작, 영문+숫자 6~20자
		ID_PATTERN("^[a-z]+[a-z0-9]{5,19}$"),
		// 닉네임 : 한글 2~8자
		NICK_PATTERN("^[가-힣]{2,8}$"),
		// 비밀번호 : 영문, 숫자, 특수문자 조합 8~16자
		PW_PATTERN("^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)-_=+]).{8,16}$");

		private final String value;

		PatternsType(String value) {
			this.value = value;
		}

		public String getValue() {
			return value;
		}

	};

	private RegexValidator() {};

	public static boolean patternCheck(String string, PatternsType patterntype) {
		return Pattern.matches(patterntype.value, string);
	}
}
