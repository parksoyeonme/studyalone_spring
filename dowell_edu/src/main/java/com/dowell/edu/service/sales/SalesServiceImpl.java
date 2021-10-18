package com.dowell.edu.service.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.sales.SalesDAO;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDAO salesDao;

	//고객판매전체조회
	@Override
	public List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param) throws Exception {
		return salesDao.selectslaesAllSearchList(param);
	}

	//고객판매수금등록 팝업 view - 판매,반품 코드
	@Override
	public List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception {
		return salesDao.selectSaltpCd(codeDetailVo);
	}

	//매장재고조회(팝업)
	@Override
	public List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception {
		return salesDao.selectpartnerInvenInqList(param);
	}

	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품코드
	@Override
	public List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception {
		return salesDao.selectprdInventorySearch(param);
	}

	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품명
	@Override
	public List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception {
		return salesDao.selectprdInventoryNm(param);
	}

	//판매상세조회 리스트나열
	@Override
	public List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception {
		return salesDao.salesDetailList(param);
	}

	
	//원본데이터-mt(고객판매)
	@Override
	public List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception {
		return salesDao.selectCustomerRtnList(param);
	}

	//원본데이터-mt(고객판매) : 반품insert
	@Override
	public int insertRtn(Map<String, Object> rtnParam) throws Exception {
		return salesDao.insertRtn(rtnParam);
	}

	//원본데이터-dt(고객판매상세)
	@Override
	public List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception {
		return salesDao.selectDetailRtnList(param);
	}

	//원본데이터-dt(고객판매상세): 반품insert
	@Override
	public int insertdetailRtn(Map<String, Object> detailParam) throws Exception {
		return salesDao.insertdetailRtn(detailParam);
	}

	//고객판매수금등록 고객판매
	@Override
	public int insertsalesRegisterMt(SalesMasterVO salesMasterVO) throws Exception {
		return salesDao.insertsalesRegisterMt(salesMasterVO);
	}
	//고객판매수금등록 고객판매상세
	@Override
	public int insertsalesRegisterDtList(Map<String, Object> dtParam) throws Exception {
		return salesDao.insertsalesRegisterDtList(dtParam);
	}

	//최신의 sal_no
	@Override
	public int selectSalNo(String prt_cd) throws Exception {
		return salesDao.selectSalNo(prt_cd);
	}

	//매장에 따른 매장현재고
	@Override
	public List<SalesIvcoMasterVO> selectDetailIvcoList(String prt_cd) throws Exception {
		return salesDao.selectDetailIvcoList(prt_cd);
	}

	//반품시 매장재고
	@Override
	public void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO) {
		salesDao.updateSalesIvcoQty(salesIvcoMasterVO);
		
	}

}
