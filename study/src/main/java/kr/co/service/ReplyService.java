package kr.co.service;

import java.util.List;

import kr.co.vo.ReplyVO;

public interface ReplyService {
	
	//댓글조회
	public List<ReplyVO> readReply(int bno) throws Exception;
	
	//댓글작성
	public void writeReply(ReplyVO replyvo) throws Exception;

}
