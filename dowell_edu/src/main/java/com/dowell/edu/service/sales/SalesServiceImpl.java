package com.dowell.edu.service.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.sales.SalesDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDAO salesDao;
	
	/*
	 * @Override public List<CustomerVO> selectcustSearchList(Map<String, Object>
	 * param) throws Exception{ return customerDao.selectcustSearchList(param); }
	 */
}
