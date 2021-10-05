package com.dowell.edu.dao.sales;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.CodeDetailVO;
import com.dowell.edu.vo.sales.SalesMasterVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	private SqlSession sqlsSession;

	@Override
	public List<SalesMasterVO> selectslaesAllSearchList(Map<String, Object> param) throws Exception {
		return sqlsSession.selectList("sales.selectslaesAllSearchList",param);
	}

	@Override
	public List<CodeDetailVO> selectSaltpCd(CodeDetailVO codeDetailVo) throws Exception {
		return sqlsSession.selectList("sales.selectSaltpCd",codeDetailVo);
	}
	
	/*
	 * @Override
	public MemberVO loginUser(MemberVO memberVo) throws Exception {
		return sqlsSession.selectOne("member.loginUser", memberVo);
	}
	 * 
	 * */
}
