package kr.co.dao.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.member.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession session;

	//회원가입
	@Override
	public void register(MemberVO memberVo) throws Exception {
		session.insert("member.register", memberVo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO memberVo) throws Exception {
		return session.selectOne("member.login", memberVo);
	}

	//회원정보 수정
	@Override
	public void memberUpdate(MemberVO memberVo) throws Exception {
		session.update("member.memberUpdate", memberVo);
		
	}

	//회원 탈퇴
	@Override
	public void memberDelete(MemberVO memberVo) throws Exception{
		session.delete("member.memberDelete", memberVo);
	}

	//패스워드 체크
	@Override
	public int passChk(MemberVO memberVo) throws Exception{
		return session.selectOne("member.passChk", memberVo);
	}

	@Override
	public int idChk(MemberVO memberVo) {
		return session.selectOne("member.idChk", memberVo);
	}
	
	
}
