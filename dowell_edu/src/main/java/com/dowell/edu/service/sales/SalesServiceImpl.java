package com.dowell.edu.service.sales;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.sales.SalesDAO;
import com.dowell.edu.vo.common.CodeDetailVO;
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
	
	/*
	 * @Override 
	 * public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
	 *  return customerDao.selectcustSearchList(param);
	 *   }
	 */
}
