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

	//고객판매수금등록 고객판매
	int insertsalesRegisterMt(SalesMasterVO salesMasterVO) throws Exception;
	//고객판매수금등록 고객판매상세
	int insertsalesRegisterDtList(Map<String, Object> dtParam) throws Exception;

	int selectSalNo(String prt_cd) throws Exception;
	//매장에 따른 매장현재고
	List<SalesIvcoMasterVO> selectDetailIvcoList(String prt_cd) throws Exception;

	void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO);

	

	

	/*
	 * 
	 * List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;
	 * */
}
