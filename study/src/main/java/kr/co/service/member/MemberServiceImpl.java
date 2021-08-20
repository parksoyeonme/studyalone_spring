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


}
