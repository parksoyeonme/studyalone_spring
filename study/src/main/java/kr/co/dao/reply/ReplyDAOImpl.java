package kr.co.dao.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.reply.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession session;

	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return session.selectList("reply.readReply", bno);
	}

	//댓글작성
	@Override
	public void writeReply(ReplyVO replyvo) throws Exception {
		session.insert("reply.writeReply", replyvo);
	}

	//댓글수정
	@Override
	public void updateReply(ReplyVO replyvo) throws Exception {
		session.update("reply.updateReply", replyvo);
		
	}

	//댓글삭제
	@Override
	public void deleteReply(ReplyVO replyvo) throws Exception {
		session.delete("reply.deleteReply", replyvo);
		
	}

	//선택한 댓글조회
	@Override
	public ReplyVO selectReply(int bno) throws Exception {
		return session.selectOne("reply.selectReply", bno);
	}

	
	
	
}
