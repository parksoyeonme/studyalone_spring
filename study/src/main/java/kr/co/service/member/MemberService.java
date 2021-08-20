package kr.co.service.member;

import kr.co.vo.member.MemberVO;

public interface MemberService {

	//회원가입
	public void register(MemberVO memberVo) throws Exception;

}
