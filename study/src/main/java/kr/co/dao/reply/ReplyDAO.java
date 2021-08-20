package kr.co.dao.reply;

import java.util.List;

import kr.co.vo.reply.ReplyVO;

public interface ReplyDAO {
	
	//댓글조회
	public List<ReplyVO> readReply(int bno) throws Exception;

	//댓글작성
	public void writeReply(ReplyVO replyvo) throws Exception;
	
	//댓글수정
	public void updateReply(ReplyVO replyvo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(ReplyVO replyvo) throws Exception;
	
	//선택한 댓글 조회
	public ReplyVO selectReply(int bno) throws Exception;
}
