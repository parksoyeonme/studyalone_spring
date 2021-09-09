package com.dowell.edu.dao.customer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSession sqlsSession;

	//고객조회(팝업)
	@Override
	public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustSearchList", param);
	}

	//고객리스트
	@Override
	public List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustAllSearchList", param);
	}

	//고객이력(팝업)
	@Override
	public List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustHistoryList", param);
	}

	@Override
	public List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsSession.selectList("customer.selectcustSsCd", codeDetailVo);
	}




}
