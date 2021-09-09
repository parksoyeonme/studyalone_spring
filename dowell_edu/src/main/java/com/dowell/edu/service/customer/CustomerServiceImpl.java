package com.dowell.edu.service.customer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.customer.CustomerDAO;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDao;


	//고객조회(팝업)
	@Override
	public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
		return customerDao.selectcustSearchList(param);
	}

	//고객리스트
	@Override
	public List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception{
		return customerDao.selectcustAllSearchList(param);
	}

	//고객이력(팝업)
	@Override
	public List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception {
		return customerDao.selectcustHistoryList(param);
	}

	//고객상태조회(cust_ss_cd)
	@Override
	public List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception {
		// TODO Auto-generated method stub
		return customerDao.selectcustSsCd(codeDetailVo);
	}

	//고객히스토리리스트(팝업)
	@Override
	public List<CodeDetailVO> custHistoryList(String cust_no) {
		// TODO Auto-generated method stub
		return customerDao.custHistoryList(cust_no);
	}

	//고객히스토리(cust_no,cust_nm)
	@Override
	public List<CustomerVO> custInfoHistoryList(String cust_no) {
		return customerDao.custInfoHistoryList(cust_no);
	}
	
	
}
