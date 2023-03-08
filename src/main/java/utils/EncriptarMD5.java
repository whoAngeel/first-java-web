/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 *
 * @author whoangel
 */
public class EncriptarMD5 {
     public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] cryptBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, cryptBytes);
            String cryptString = numero.toString(16);
            while (cryptString.length() < 32) {
                cryptString = "0" + cryptString;
            }
            return cryptString;
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    }
    
}
