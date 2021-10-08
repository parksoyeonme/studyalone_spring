package com.dowell.edu.dao.sales;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	private SqlSession sqlsSession;

	@Override
	public List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectslaesAllSearchList",param);
	}

	@Override
	public List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("sales.selectSaltpCd",codeDetailVo);
	}

	@Override
	public List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectpartnerInvenInqList",param);
	}


	@Override
	public List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return sqlsSession.selectList("sales.selectprdInventorySearch",param);
	}

	@Override
	public List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return sqlsSession.selectList("sales.selectprdInventoryNm",param);
	}

	@Override
	public List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return sqlsSession.selectList("sales.salesDetailList",param);
	}

	@Override
	public List<SalesMasterVO> selectSalesDetailHead(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectSalesDetailHead",param);
	}
	
	/*
	 * @Override
	public MemberVO loginUser(MemberVO memberVo) throws Exception {
		return sqlsSession.selectOne("member.loginUser", memberVo);
	}
	 * 
	 * */
}
