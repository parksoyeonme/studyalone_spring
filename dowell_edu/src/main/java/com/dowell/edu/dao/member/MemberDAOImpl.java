package com.dowell.edu.dao.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.customer.CustomerVO;
import com.dowell.edu.vo.member.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsSession;

	//로그인
	@Override
	public MemberVO loginUser(MemberVO memberVo) throws Exception {
		return sqlsSession.selectOne("member.loginUser", memberVo);
	}

	
}
