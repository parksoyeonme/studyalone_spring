package kr.co.dao.member;

import kr.co.vo.member.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO memberVo) throws Exception;

}
