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

	@Override
	public List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param) throws Exception {
		return salesDao.selectslaesAllSearchList(param);
	}

	@Override
	public List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception {
		return salesDao.selectSaltpCd(codeDetailVo);
	}

	@Override
	public List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception {
		return salesDao.selectpartnerInvenInqList(param);
	}

	
	@Override
	public List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception {
		return salesDao.selectprdInventorySearch(param);
	}

	@Override
	public List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception {
		// TODO Auto-generated method stub
		return salesDao.selectprdInventoryNm(param);
	}

	@Override
	public List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception {
		return salesDao.salesDetailList(param);
	}

	@Override
	public List<SalesMasterVO> selectSalesDetailHead(Map<String, Object> param) throws Exception {
		return salesDao.selectSalesDetailHead(param);
	}

	@Override
	public List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception {
		return salesDao.selectCustomerRtnList(param);
	}

	@Override
	public int insertRtn(Map<String, Object> rtnParam) throws Exception {
		return salesDao.insertRtn(rtnParam);
	}

	@Override
	public List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception {
		return salesDao.selectDetailRtnList(param);
	}

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

	@Override
	public void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO) {
		salesDao.updateSalesIvcoQty(salesIvcoMasterVO);
		
	}

	
	
	



	
	
	/*
	 * @Override 
	 * public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
	 *  return customerDao.selectcustSearchList(param);
	 *   }
	 */
}
