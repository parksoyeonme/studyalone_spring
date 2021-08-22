package kr.co.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.member.MemberDAO;
import kr.co.vo.member.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDao;
	
	//회원가입
	@Override
	public void register(MemberVO memberVo) throws Exception {
		memberDao.register(memberVo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO memberVo) throws Exception {
		return memberDao.login(memberVo);
	}

	//회원정보수정
	@Override
	public void memberUpdate(MemberVO memberVo) throws Exception {
		memberDao.memberUpdate(memberVo);
		
	}

	//회원탈퇴
	@Override
	public void memberDelete(MemberVO memberVo) throws Exception {
		memberDao.memberDelete(memberVo);
		
	}
	
	//패스워드 체크
	@Override
	public int passChk(MemberVO memberVo) throws Exception{
		int result = memberDao.passChk(memberVo);
		return result;
	}

	//아이디 중복 체크
	@Override
	public int idChk(MemberVO memberVo) {
		int result = memberDao.idChk(memberVo);
		return result;
	}


}
