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

	//고객판매전체조회
	@Override
	public List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectslaesAllSearchList",param);
	}

	//고객판매수금등록 팝업 view - 판매,반품 코드
	@Override
	public List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("sales.selectSaltpCd",codeDetailVo);
	}
	
	//매장재고조회(팝업)
	@Override
	public List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectpartnerInvenInqList",param);
	}

	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품코드
	@Override
	public List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectprdInventorySearch",param);
	}

	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품명
	@Override
	public List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectprdInventoryNm",param);
	}

	//판매상세조회 리스트나열
	@Override
	public List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.salesDetailList",param);
	}


	//원본데이터-mt(고객판매)
	@Override
	public List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectCustomerRtnList",param);
	}

	//원본데이터-mt(고객판매) : 반품insert
	@Override
	public int insertRtn(Map<String, Object> rtnParam) throws Exception {
		return sqlsSession.insert("sales.insertRtn",rtnParam);
	}

	//원본데이터-dt(고객판매상세)
	@Override
	public List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectDetailRtnList",param);
	}

	//원본데이터-dt(고객판매상세): 반품insert
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
	//최신의 sal_no
	@Override
	public int selectSalNo(String prt_cd) throws Exception {
		return sqlsSession.selectOne("sales.selectSalNo",prt_cd);
	}

	//매장에 따른 매장현재고
	@Override
	public List<SalesIvcoMasterVO> selectDetailIvcoList(String prt_cd) throws Exception {
		return sqlsSession.selectList("sales.selectDetailIvcoList",prt_cd);
	}

	//반품시 매장재고
	@Override
	public void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO) {
		sqlsSession.update("sales.updateSalesIvcoQty",salesIvcoMasterVO);
		
	}

}
