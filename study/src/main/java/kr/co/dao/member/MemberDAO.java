package kr.co.dao.member;

import kr.co.vo.member.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void register(MemberVO memberVo) throws Exception;

	//로그인
	public MemberVO login(MemberVO memberVo) throws Exception;

	//회원정보수정
	public void memberUpdate(MemberVO memberVo) throws Exception;

	//회원탈퇴
	public void memberDelete(MemberVO memberVo) throws Exception;

	//패스워드 체크
	public int passChk(MemberVO memberVo) throws Exception;

	//아이디 중복체크
	public int idChk(MemberVO memberVo);
	
	
	

}
