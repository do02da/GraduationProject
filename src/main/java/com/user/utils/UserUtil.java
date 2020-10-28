package com.user.utils;

import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Component;

@Component("userUtil")
public class UserUtil {
	public String encryptPassword(String id, String pw) throws Exception {
		byte[] hashValue = null;
		
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		
		md.reset();
		md.update(id.getBytes());
		
		hashValue = md.digest(pw.getBytes());
		
		return new String(Base64.encodeBase64(hashValue));
	}
}
