package com.dowell.edu.dao.customer;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

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
	List<CodeDetailVO> custHistoryList(String cust_no) throws Exception;
	
	//고객히스토리(cust_no,cust_nm)
	List<CustomerVO> custInfoHistoryList(String cust_no) throws Exception;

	//신규고객등록(sex_cd,poc_cd)
	List<CodeDetailVO> selectcodeCd(CodeDetailVO codeDetailVo) throws Exception;

	//신규등록
	int insertcust(Map<String, Object> param) throws Exception;

	//이메일 중복체크
	int emailCheck(Map<String, Object> param) throws Exception;

	//휴대폰 중복체크
	int mblCheck(Map<String, Object> param) throws Exception;

	//고객정보조회(공통코드)
	List<CodeDetailVO> selectcommCd(CodeDetailVO codeDetailVo) throws Exception;

	//고객정보조회list
	List<CustomerVO> selectDetailOne(String cust_no) throws Exception;

	//고객정보조회 update
	int updatecustDetail(Map<String, Object> updateParam) throws Exception;

	//int insertCustHistory(Map<String, Object> param2)throws Exception;

	//int insertCustHistory(List<CustomerHistoryVO> customerHistoryList);

	int insertCustHistory(Map<String, Object> insertParam);

	int selectSeqCount(String cust_no);

	



	
}
