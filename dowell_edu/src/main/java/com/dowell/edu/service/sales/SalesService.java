package com.dowell.edu.service.sales;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesDetailVO;
import com.dowell.edu.vo.sales.SalesIvcoMasterVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

public interface SalesService {

	//고객판매전체조회
	List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param)throws Exception;
	
	//고객판매수금등록 팝업 view - 판매,반품 코드
	List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception;
	
	//매장재고조회(팝업)
	List<SalesIvcoMasterVO> selectpartnerInvenInqList(Map<String, Object> param) throws Exception;
	
	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품코드
	List<SalesIvcoMasterVO> selectprdInventorySearch(Map<String, Object> param) throws Exception;
	
	//고객판매수금등록(팝업)안의 grid에서 조회 - 상품명
	List<SalesIvcoMasterVO> selectprdInventoryNm(Map<String, Object> param) throws Exception;

	//판매상세조회 리스트나열
	List<SalesMasterVO> salesDetailList(Map<String, Object> param) throws Exception;


	//원본데이터-mt(고객판매)
	List<SalesMasterVO> selectCustomerRtnList(Map<String, Object> param) throws Exception;
	
	//원본데이터-mt(고객판매) : 반품insert
	int insertRtn(Map<String, Object> rtnParam) throws Exception;

	//원본데이터-dt(고객판매상세)
	List<SalesDetailVO> selectDetailRtnList(Map<String, Object> param) throws Exception;

	//원본데이터-dt(고객판매상세): 반품insert
	int insertdetailRtn(Map<String, Object> detailParam) throws Exception;

	//고객판매수금등록 고객판매
	int insertsalesRegisterMt(SalesMasterVO salesMasterVO) throws Exception;

	//고객판매수금등록 고객판매상세
	int insertsalesRegisterDtList(Map<String, Object> dtParam) throws Exception;
	
	//최신의 sal_no
	int selectSalNo(String prt_cd) throws Exception;

	//매장에 따른 매장현재고
	List<SalesIvcoMasterVO> selectDetailIvcoList(String prt_cd) throws Exception;
	
	//반품시 매장재고
	void updateSalesIvcoQty(SalesIvcoMasterVO salesIvcoMasterVO) throws Exception;

}
