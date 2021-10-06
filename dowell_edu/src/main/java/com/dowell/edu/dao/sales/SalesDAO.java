package com.dowell.edu.dao.sales;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

public interface SalesDAO {

	List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param)throws Exception;

	List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception;

	List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception;

	/*
	 * 
	 * List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;
	 * */
}
