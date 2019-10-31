package kr.or.ddit.utiles;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpSession;

public class CryptoGenerator {
	
	// 비대칭키 암호화 통신 기법
	// * 공개키와 비밀키는 쌍으로 생성 후 1회 생성 및 1회 사용 후 폐기.
	// 공개키 (클라이언트에 제공) - 클라이언트가 취득한 공개키를 활용해 평문을 암호화 시킴.
	// 비밀키 (서버에 저장 활용 - 공개키를 통해 암호화 되어 전송된 값을 비밀키를 활용해 복호화 (평문으로 변경)

	// 반환값 : Map<String,String> 공개키의 가수부, 지수부 분리해서 저장 후
	// 클라이언트에 제공
	// 파라메터 : HttpSession - 비밀키 저장 활용.

	public static Map<String, String> generatePairKey(HttpSession session) {

		// 공개키, 비밀키 생성
		KeyPairGenerator keyGenerator = null;

		// 생성된 공개키, 비밀키 저장
		KeyPair keyPair = null;

		// 공개키
		PublicKey publicKey = null;

		// 비밀키
		PrivateKey privateKey = null;

		// 공개키의 가수부, 지수부 분리 반환
		KeyFactory keyFactory = null;

		Map<String, String> publicKeyMap = new HashMap<String, String>();

		// RSA(MIT 에서 1964년에 최초 개발된 암호화 알고리즘)
		// 한국인터넷진흥원 : RSA _ SHA256 병행사용(권장)

		try {
			keyGenerator = KeyPairGenerator.getInstance("RSA");

		// RSA 암호화 알고리즘을 통해서 암호화되는 암호화결과값의 사이즈를 지정.(항상짝수 - bit단위)
			keyGenerator.initialize(2048);

		// 공개키와 비밀키를 생성
			keyPair = keyGenerator.generateKeyPair();

		// 공개키 취득
			publicKey = keyPair.getPublic();

		// 비밀키 취득
			privateKey = keyPair.getPrivate();
			session.setAttribute("privateKey", privateKey); // 비밀 키 저장

		// 공개키(Double)를 가수부, 지수부 분리해서 반환
		// 컴퓨터는 빼기를 못해 .....
		// float type(4byte : 32bit - 단정도) : 전체 32bit 최초 1bit(부호비트
		// (양수0|음수1)) + 지수8bit(소숫점 자리) + 가수 23bit (값)
		// double type(8byte : 64bit - 배정도) : 전체 64bit 최초 1bit(부호비트
		// (양수0|음수1)) + 지수11bit(소숫점 자리) + 가수 52bit (값)

			keyFactory = KeyFactory.getInstance("RSA");
			RSAPublicKeySpec keySpect = (RSAPublicKeySpec) keyFactory
					.getKeySpec(publicKey, RSAPublicKeySpec.class);

			// 공개키의 가수부
			String publicModulus = keySpect.getModulus().toString(16);
			// 공개키의 지수부
			String publicExponent = keySpect.getPublicExponent().toString(16);

			publicKeyMap.put("publicModulus", publicModulus);
			publicKeyMap.put("publicExponent", publicExponent);

		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return publicKeyMap;
	}
	
		// 클라이언트에 제공된 공개키(가수부, 지수부)활용해 평문을 암호문으로 변경
	    // 서버대상에 전송하면, 서버 내 저장된 비밀키를 활용해 암호문을 평문으로 복호화 활용
	
	public  static String decryptRSA(HttpSession session, String secureValue){
		
		PrivateKey privateKey = (PrivateKey) session.getAttribute("privateKey");
	
		String returnValue = "";
		
		try {
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			
			byte[] targetByte = hexToByteArray(secureValue);
			
			byte[] beforeString = cipher.doFinal(targetByte);
			
			returnValue = new String(beforeString,"UTF-8");
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return returnValue;
	}

	private static byte[] hexToByteArray(String secureValue) {
		if(secureValue == null || secureValue.length()%2 !=0){
			return new byte[]{}	;
		}
		
		byte[] bytes = new byte[secureValue.length()/2];
		
		for(int i=0; i<secureValue.length(); i+=2){
			
			byte value =(byte) Integer.parseInt(secureValue.substring(i,i+2),16);
		
			bytes[(int) Math.floor(i / 2)] = value;

		}

		return bytes;
	}
}
