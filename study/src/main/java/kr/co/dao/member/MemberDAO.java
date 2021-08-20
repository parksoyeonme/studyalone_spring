package kr.co.dao.member;

import kr.co.vo.member.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO memberVo) throws Exception;

	//로그인
	public MemberVO login(MemberVO memberVo) throws Exception;

	//회원정보수정
	public void memberUpdate(MemberVO memberVo) throws Exception;
	
	
	

}
