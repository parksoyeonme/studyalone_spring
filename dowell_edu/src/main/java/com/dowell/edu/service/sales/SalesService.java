package com.dowell.edu.service.sales;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

public interface SalesService {

	List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param)throws Exception;

	List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception;

	List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception;

	/*
	 * //고객조회(팝업)
	List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;

	 * */
}
