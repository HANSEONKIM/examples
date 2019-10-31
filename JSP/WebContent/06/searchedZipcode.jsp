<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipCodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeServiceImpl"%>
<%@page import="kr.or.ddit.zipcode.service.IZipCodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String dong = request.getParameter("dong");
	
	Map<String,String> params = new HashMap<String, String> ();
	params.put("dong",dong);

	IZipCodeService service = IZipCodeServiceImpl.getInstance();
	List<ZipCodeVO> zipcodeList = service.zipcodeList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(zipcodeList);
	
	out.println(jsonData);

%> 
