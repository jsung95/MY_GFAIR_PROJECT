package com.korea.gfair.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Random;
import java.util.UUID;

import lombok.extern.log4j.Log4j2;


@Log4j2
public class UUIDGenerator {

    private static final char[] hexArray = "0123456789ABCDEF".toCharArray();
    
    /***************************************************************
     * 이거씁니다. 이거요 이거 이거씁니다 ㅎㅎ
     ***************************************************************/
    public static String generateUniqueKeysWithUUIDAndMessageDigest(String memberpw) 
    		throws NoSuchAlgorithmException, UnsupportedEncodingException {
    	log.debug("generateUniqueKeysWithUUIDAndMessageDigest() invoked.");
    	
        MessageDigest salt = MessageDigest.getInstance("SHA-256");
        
        salt.update(memberpw.toString().getBytes("UTF-8"));
        
        String digest = bytesToHex(salt.digest());
        
        return digest;
    } // generateUniqueKeysWithUUIDAndMessageDigest
    

    private static String bytesToHex(byte[] bytes) {
    	log.debug("bytesToHex(bytes) invoked.");
    	
        char[] hexChars = new char[bytes.length * 2];
        
        for (int j = 0; j < bytes.length; j++) {
            int v = bytes[j] & 0xFF;
            
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        } // for
        
        return new String(hexChars);
    } // bytesToHex
    /***************************************************************
     * 이거씁니다. 이거요 이거 이거씁니다 ㅎㅎ
     ***************************************************************/

    
} // end class