package com.dowell.edu.service.customer;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

public interface CustomerService {

	//고객조회(팝업)
	List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception;

	//고객리스트
	List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception;

	//고객이력(팝업)
	List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception;

	//고객상태조회(cust_ss_cd)
	List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception;

	//고객히스토리리스트(팝업)
	List<CodeDetailVO> custHistoryList(String cust_no) throws Exception;

	//고객히스토리(cust_no,cust_nm) 공통코드
	List<CustomerVO> custInfoHistoryList(String cust_no) throws Exception;

	//신규고객등록(sex_cd,poc_Cd) 공통코드
	List<CodeDetailVO> selectcodeCd(CodeDetailVO codeDetailVo) throws Exception;

	//신규등록
	int insertcust(Map<String, Object> param) throws Exception;

	//신규고객 등록 이메일 중복체크
	int emailCheck(Map<String, Object> param) throws Exception;
	
	//신규고객등록 휴대폰 중복체크
	int mblCheck(Map<String, Object> param) throws Exception;

	//정보 수정시 휴대폰 중복체크
	int mblCheckDetail(Map<String, Object> param) throws Exception;

	//고객정보조회(공통코드)
	List<CodeDetailVO> selectcommCd(CodeDetailVO codeDetailVo) throws Exception;

	//고객정보조회list
	List<CustomerVO> selectDetailOne(String cust_no) throws Exception;

	//고객정보조회 update
	int updatecustDetail(Map<String, Object> updateParam) throws Exception;

	//고객이력 insert
	int insertCustHistory(Map<String, Object> insertParam) throws Exception;

	//정보 수정시 이메일 중복체크
	int emailCheckDetail(Map<String, Object> param) throws Exception;

	


}
