package kr.or.ddit.zipcode.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ZipCodeVO;
import kr.or.ddit.zipcode.dao.IZipCodeDao;
import kr.or.ddit.zipcode.dao.IZipCodeDaoImpl;

public class IZipCodeServiceImpl implements IZipCodeService {

	private static IZipCodeService service = new IZipCodeServiceImpl();
	
	private IZipCodeDao dao;
	
	
	// 외부에서 무분별하게 생성자를 만드는것을 막기우해,,
	private IZipCodeServiceImpl(){
		
		dao = IZipCodeDaoImpl.getInstance();
	}
	
	public static IZipCodeService getInstance(){
		return(service ==null) ? service = new IZipCodeServiceImpl() : service;
	}
	
	
	
	@Override
	public List<ZipCodeVO> zipcodeList(Map<String, String> params) {
		List<ZipCodeVO> zipcodeList = null;
		
		try {
			zipcodeList = dao.zipcodeList(params);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return zipcodeList;
	}

}
