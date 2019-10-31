package kr.or.ddit.utiles;

import java.io.BufferedReader;
import java.sql.Clob;

public class CLODToStringConvert {
	//CLOB 타입의 객체를 convert 메서드의 아귀먼트로 전달.
	//반환값 : 문자열
	
	public static String convert(Object targetData) throws Exception{
		
		StringBuffer buffer = new StringBuffer();
		//CLOB 타입 객체 내 문자열 취득을 위한 스트리밍 설정.
		
		BufferedReader reader = new BufferedReader(
						((Clob)targetData).getCharacterStream());
		
		String dummy = "";
		
		while((dummy=reader.readLine())!=null){
			//CLOB 타입 객체로부터 문자열 취득 후 저장
			buffer.append(dummy);
		}
		reader.close();
		
		//문자열반환
		
		return buffer.toString();		
	}
	
	
}
