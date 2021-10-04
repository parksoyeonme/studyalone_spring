package com.dowell.edu.dao.sales;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Autowired
	private SqlSession sqlsSession;
	
	/*
	 * @Override
	public MemberVO loginUser(MemberVO memberVo) throws Exception {
		return sqlsSession.selectOne("member.loginUser", memberVo);
	}
	 * 
	 * */
}
