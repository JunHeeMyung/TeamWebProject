package com.zumuniyo.util;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JsonTest {
	
	public static void main(String[] args) {
		
		String str = " [ { \"이름\":\"홍길동\" , \"나이\": 25  } ,{ \"이름\":\"김철수\" , \"나이\": 21  }]";
		
		
		JSONParser parsor = new JSONParser();
		JSONArray jsonArray=null;
		try {
			jsonArray= (JSONArray) parsor.parse(str);
		} catch (ParseException e) {
			System.out.println("파싱불가");
			return;
		}
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObject = (JSONObject)jsonArray.get(i);
			String name = (String)jsonObject.get("이름");
			int age = Integer.parseInt(jsonObject.get("나이").toString());
			
			System.out.println(name);
			System.out.println(age);
			
		}

		
	}

	

}
