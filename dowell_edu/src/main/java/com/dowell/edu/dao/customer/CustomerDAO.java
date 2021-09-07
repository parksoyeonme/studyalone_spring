package com.dowell.edu.dao.customer;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;

public interface CustomerDAO {

	//고객조회(팝업)
	List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;

	//고객리스트
	List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception;

	//고객이력(팝업)
	List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception;

	

}
