package com.dowell.edu.dao.sales;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesDetailVO;
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

	@Override
	public List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectCustomerRtnList",param);
	}

	@Override
	public int insertRtn(Map<String, Object> rtnParam) throws Exception {
		return sqlsSession.insert("sales.insertRtn",rtnParam);
	}

	@Override
	public List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectDetailRtnList",param);
	}

	@Override
	public int insertdetailRtn(Map<String, Object> detailParam) throws Exception {
		return sqlsSession.update("sales.insertdetailRtn",detailParam);
	}

	//고객판매수금등록 고객판매
	@Override
	public int insertsalesRegisterMt(SalesMasterVO salesMasterVO) throws Exception {
		return sqlsSession.insert("sales.insertsalesRegisterMt",salesMasterVO);
	}

	//고객판매수금등록 고객판매상세
	@Override
	public int insertsalesRegisterDtList(Map<String, Object> dtParam) throws Exception {
		return sqlsSession.update("sales.insertsalesRegisterDtList",dtParam);
	}
	//가장 최신의 sal_no
	@Override
	public int selectSalNo(String prt_cd) throws Exception {
		return sqlsSession.selectOne("sales.selectSalNo",prt_cd);
	}

	//매장에 따른 매장현재고
	@Override
	public List<SalesIvcoMasterVO> selectDetailIvcoList(String prt_cd) throws Exception {
		return sqlsSession.selectList("sales.selectDetailIvcoList",prt_cd);
	}

	@Override
	public void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO) {
		sqlsSession.update("sales.updateSalesIvcoQty",salesIvcoMasterVO);
		
	}

	
	



	
	
	/*
	 * @Override
	public MemberVO loginUser(MemberVO memberVo) throws Exception {
		return sqlsSession.selectOne("member.loginUser", memberVo);
	}
	 * 
	 * */
}
