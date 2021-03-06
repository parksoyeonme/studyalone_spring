package com.dowell.edu.dao.customer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	@Autowired
	private SqlSession sqlsSession;

	//고객조회(팝업)
	@Override
	public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustSearchList", param);
	}

	//고객리스트
	@Override
	public List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustAllSearchList", param);
	}

	//고객이력(팝업)
	@Override
	public List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception{
		return sqlsSession.selectList("customer.selectcustHistoryList", param);
	}

	//고객상태조회(cust_ss_cd)
	@Override
	public List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("customer.selectcustSsCd", codeDetailVo);
	}

	//고객히스토리리스트(팝업)
	@Override
	public List<CodeDetailVO> custHistoryList(String cust_no) throws Exception {
		return sqlsSession.selectList("customer.custHistoryList", cust_no);
	}

	//고객히스토리(cust_no,cust_nm)
	@Override
	public List<CustomerVO> custInfoHistoryList(String cust_no) throws Exception {
		return sqlsSession.selectList("customer.custInfoHistoryList", cust_no);
	}

	//신규고객등록(sex_cd,poc_cd)
	@Override
	public List<CodeDetailVO> selectcodeCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("customer.selectcodeCd", codeDetailVo);
	}

	//신규등록
	@Override
	public int insertcust(Map<String, Object> param) throws Exception {
		return sqlsSession.insert("customer.insertcust", param);
	}

	//신규고객등록 이메일 중복체크
	@Override
	public int emailCheck(Map<String, Object> param) throws Exception {
		return sqlsSession.selectOne("customer.emailCheck", param);
	}

	//신규고객등록 휴대폰 중복체크
	@Override
	public int mblCheck(Map<String, Object> param) throws Exception {
		return sqlsSession.selectOne("customer.mblCheck", param);
	}

	//고객정보조회(공통코드)
	@Override
	public List<CodeDetailVO> selectcommCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("customer.selectcommCd", codeDetailVo);
	}

	//고객정보조회(수정update) 수정하기 
	@Override
	public int updatecustDetail(Map<String, Object> updateParam) throws Exception {
		return sqlsSession.update("customer.updatecustDetail", updateParam);
	}

	//고객정보조회(수정update) 고객정보 불러오기
	@Override
	public List<CustomerVO> selectDetailOne(String cust_no) throws Exception {
		return sqlsSession.selectList("customer.selectDetailOne", cust_no);	
	}

	//고객정보조회 insert : 고객이력테이블
	@Override
	public int insertCustHistory(Map<String, Object> insertParam) {
		return sqlsSession.update("customer.insertCustHistory", insertParam);
	}

	//정보 수정시 휴대폰 중복체크
	@Override
	public int mblCheckDetail(Map<String, Object> param) {
		return sqlsSession.selectOne("customer.mblCheckDetail", param);
	}

	//정보 수정시 이메일 중복체크
	@Override
	public int emailCheckDetail(Map<String, Object> param) throws Exception {
		return sqlsSession.selectOne("customer.emailCheckDetail", param);
	}




}
