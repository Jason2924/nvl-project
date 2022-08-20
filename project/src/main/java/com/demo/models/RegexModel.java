package com.demo.models;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexModel {
	
	public boolean regex(String key, String value) {
		try {
			String regex = "";
			switch(key) {
				case "username": regex = "^[A-Za-z0-9]{6,30}$"; break;
				case "password": regex = "^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).\\S{5,30})$"; break;
				case "fullName": regex = "^((\\w+).[^`~!@#$%^&*()_+-=,.\\/<>?;':\"\\[\\]\\\\|]{6,})$"; break;
				case "phone": regex = "^[0-9]{10,12}$"; break;
				case "email": regex = "([a-zA-Z0-9]+)([\\_\\.\\-{1}])?([a-zA-Z0-9]+)\\@([a-zA-Z0-9]+)([\\.])([a-zA-Z\\.]+)"; break;
			}
			return !isMatch(regex, value);
		} catch (Exception e) {
			System.err.println("RegexModel - regex :\n" + e.getStackTrace());
		}
		return false;
	}
	
	private boolean isMatch(String regex, String value) {
		try {
			Pattern patern = Pattern.compile(regex);
			Matcher matcher = patern.matcher(value);
			return matcher.matches();
		} catch (Exception e) {
			System.err.println("RegexModel - isMatch :\n" + e.getStackTrace());
		}
		return false;
	}
	
}
