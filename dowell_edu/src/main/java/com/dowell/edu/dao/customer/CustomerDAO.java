package com.dowell.edu.dao.customer;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;

public interface CustomerDAO {

	//고객조회(팝업)
	List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;

	//고객리스트
	List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception;

	//고객이력(팝업)
	List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception;

	//고객상태조회(cust_ss_cd)
	List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception;
	
	//고객히스토리리스트(팝업)
	List<CodeDetailVO> custHistoryList(String cust_no);
	
	//고객히스토리(cust_no,cust_nm)
	List<CustomerVO> custInfoHistoryList(String cust_no);

	
}
