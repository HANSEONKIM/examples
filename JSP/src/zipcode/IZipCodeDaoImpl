package kr.or.ddit.zipcode.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.ibatis.factory.SqlMapClientFactory;
import kr.or.ddit.vo.ZipCodeVO;

public class IZipCodeDaoImpl implements IZipCodeDao {
	
	private static IZipCodeDao dao = new IZipCodeDaoImpl();
	
	private SqlMapClient client;
	
	private IZipCodeDaoImpl(){
		client = SqlMapClientFactory.getSqlMapClient();
		
	}
	
	public static IZipCodeDao getInstance(){
		
		return(dao ==null) ? dao = new IZipCodeDaoImpl(): dao;
	}
	
	

	@Override
	public List<ZipCodeVO> zipcodeList(Map<String, String> params)
			throws SQLException {
		return client.queryForList("zipcode.zipcodeList",params);
	}

}
