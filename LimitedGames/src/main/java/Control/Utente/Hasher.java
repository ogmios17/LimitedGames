package Control.Utente;

import java.nio.charset.StandardCharsets;

public class Hasher {
	
	protected static String toHash(String pwd) {
	    try {
	        java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-512");
	        byte[] hash = digest.digest(pwd.getBytes(StandardCharsets.UTF_8));

	        StringBuilder hashString = new StringBuilder();
	        for (byte b : hash) {
	            hashString.append(String.format("%02x", b));
	        }

	        return hashString.toString();

	    } catch (java.security.NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
}
