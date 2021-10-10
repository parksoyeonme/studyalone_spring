package com.dowell.edu.dao.sales;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.sales.SalesDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

public interface SalesDAO {

	List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param)throws Exception;

	List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception;

	List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception;

	List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception;

	List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception;

	List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception;

	List<SalesMasterVO> selectSalesDetailHead(Map<String, Object> param) throws Exception;

	List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception;

	int insertRtn(Map<String, Object> rtnParam) throws Exception;

	List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception;

	int insertdetailRtn(Map<String, Object> detailParam) throws Exception;

	/*
	 * 
	 * List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;
	 * */
}
