package com.roadruwa.comm;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CryptoUtil { 
	
	public final static byte[] myIV = "itsm.sjh".getBytes();
	public final static byte[] desKeyData = "abcdefhijkabcdefhijkabcd".getBytes(); // 168bit(암호)+24bit(패리티)=24byte
	public final static byte[] desKeyData0 = "abcdefhi".getBytes(); // 56bit(암호)+8bit(패리티)=8byte

	public static String encryptDES(String data) throws Exception {
		if (data == null || data.length() == 0)
			return "";
		Cipher c3des = Cipher.getInstance("DES/CBC/PKCS5Padding");
		SecretKeySpec myKey = new SecretKeySpec(desKeyData0, "DES");
		IvParameterSpec ivspec = new IvParameterSpec(myIV);
		c3des.init(Cipher.ENCRYPT_MODE, myKey, ivspec);
		byte[] inputBytes1 = data.getBytes("UTF8");
		byte[] outputBytes1 = c3des.doFinal(inputBytes1);

		return Base64.getEncoder().encodeToString(outputBytes1);
	}

	public static String decryptDES(String data) throws Exception {
		if (data == null || data.length() == 0)
			return "";

		Cipher c3des = Cipher.getInstance("DES/CBC/PKCS5Padding");
		SecretKeySpec myKey = new SecretKeySpec(desKeyData0, "DES");
		IvParameterSpec ivspec = new IvParameterSpec(myIV);
		c3des.init(Cipher.DECRYPT_MODE, myKey, ivspec);

		byte[] inputBytes1 = Base64.getDecoder().decode(data);
		byte[] outputBytes2 = c3des.doFinal(inputBytes1);
		return new String(outputBytes2, "UTF8");
	}

	public static String encrypt3DES(String data) throws Exception {
		if (data == null || data.length() == 0)
			return "";

		Cipher c3des = Cipher.getInstance("DESede/CBC/PKCS5Padding");

		SecretKeySpec myKey = new SecretKeySpec(desKeyData, "DESede");

		IvParameterSpec ivspec = new IvParameterSpec(myIV);
		c3des.init(Cipher.ENCRYPT_MODE, myKey, ivspec);
		byte[] inputBytes1 = data.getBytes("UTF8");
		byte[] outputBytes1 = c3des.doFinal(inputBytes1);

		return Base64.getEncoder().encodeToString(outputBytes1);
	}

	public static String decrypt3DES(String data) throws Exception {

		if (data == null || data.length() == 0)
			return "";

		Cipher c3des = Cipher.getInstance("DESede/CBC/PKCS5Padding");
		SecretKeySpec myKey = new SecretKeySpec(desKeyData, "DESede");

		IvParameterSpec ivspec = new IvParameterSpec(myIV);
		c3des.init(Cipher.DECRYPT_MODE, myKey, ivspec);

		byte[] inputBytes1 = Base64.getDecoder().decode(data);
		byte[] outputBytes2 = c3des.doFinal(inputBytes1);
		return new String(outputBytes2, "UTF8");
	}
	
	public static String SHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();

			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
}
