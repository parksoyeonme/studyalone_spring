package com.dowell.edu.service.customer;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.customer.CustomerDAO;
import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.customer.CustomerHistoryVO;
import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO customerDao;


	//고객조회(팝업)
	@Override
	public List<CustomerVO> selectcustSearchList(Map<String, Object> param) throws Exception{
		return customerDao.selectcustSearchList(param);
	}

	//고객리스트
	@Override
	public List<CustomerVO> selectcustAllSearchList(Map<String, Object> param) throws Exception{
		return customerDao.selectcustAllSearchList(param);
	}

	//고객이력(팝업)
	@Override
	public List<CustomerHistoryVO> selectcustHistoryList(Map<String, Object> param) throws Exception {
		return customerDao.selectcustHistoryList(param);
	}

	//고객상태조회(cust_ss_cd)
	@Override
	public List<CodeDetailVO> selectcustSsCd(CodeDetailVO codeDetailVo) throws Exception {
		return customerDao.selectcustSsCd(codeDetailVo);
	}

	//고객히스토리리스트(팝업)
	@Override
	public List<CodeDetailVO> custHistoryList(String cust_no) throws Exception {
		return customerDao.custHistoryList(cust_no);
	}

	//고객히스토리(cust_no,cust_nm)
	@Override
	public List<CustomerVO> custInfoHistoryList(String cust_no) throws Exception {
		return customerDao.custInfoHistoryList(cust_no);
	}

	
	//신규고객등록(sex_cd,poc_Cd)
	@Override
	public List<CodeDetailVO> selectcodeCd(CodeDetailVO codeDetailVo) throws Exception {
		return customerDao.selectcodeCd(codeDetailVo);
	}

	//신규등록
	@Override
	public int insertcust(Map<String, Object> param) throws Exception {
		return customerDao.insertcust(param);
	}

	//이메일 중복체크
	@Override
	public int emailCheck(Map<String, Object> param) throws Exception {
		return customerDao.emailCheck(param);
	}

	//휴대폰번호 중복체크
	@Override
	public int mblCheck(Map<String, Object> param) throws Exception {
		return customerDao.mblCheck(param);
	}

	//고객정보조회(공통코드)
	@Override
	public List<CodeDetailVO> selectcommCd(CodeDetailVO codeDetailVo) throws Exception {
		return customerDao.selectcommCd(codeDetailVo);
	}

	//고객정보조회 update
	@Override
	public int updatecustDetail(Map<String, Object> updateParam) throws Exception {
		return customerDao.updatecustDetail(updateParam);
	}

	//고객정보조회(수정update) 고객정보 불러오기
	@Override
	public List<CustomerVO> selectDetailOne(String cust_no) throws Exception {
		return customerDao.selectDetailOne(cust_no);
	}

	//고객이력 insert
	@Override
	public int insertCustHistory(Map<String, Object> insertParam) throws Exception {
		return customerDao.insertCustHistory(insertParam);
	}

	//정보 수정시 휴대폰 중복체크
	@Override
	public int mblCheckDetail(Map<String, Object> param) throws Exception {
		return customerDao.mblCheckDetail(param);
	}
	//정보 수정시 이메일 중복체크
	@Override
	public int emailCheckDetail(Map<String, Object> param) throws Exception {
		return customerDao.emailCheckDetail(param);
	}

	

	
}
