package com.dowell.edu.dao.member;

import com.dowell.edu.vo.member.MemberVO;

public interface MemberDAO {

	//로그인
	public MemberVO loginUser(MemberVO memberVo) throws Exception;

}
