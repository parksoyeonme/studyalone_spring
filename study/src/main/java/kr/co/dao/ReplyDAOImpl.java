package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;

	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return session.selectList("reply.readReply", bno);
	}
	
}
