package com.dowell.edu.service.member;

import com.dowell.edu.vo.member.MemberVO;

public interface MemberService {

	//로그인
	public MemberVO loginUser(MemberVO memberVo) throws Exception;

}
