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
	
	
}
