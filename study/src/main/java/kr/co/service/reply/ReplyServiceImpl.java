package kr.co.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.reply.ReplyDAO;
import kr.co.vo.reply.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	
	//댓글조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	//댓글작성
	@Override
	public void writeReply(ReplyVO replyvo) throws Exception {
		dao.writeReply(replyvo);
	}

	//댓글수정
	@Override
	public void updateReply(ReplyVO replyvo) throws Exception {
		dao.updateReply(replyvo);
		
	}

	//댓글삭제
	@Override
	public void deleteReply(ReplyVO replyvo) throws Exception {
		dao.deleteReply(replyvo);
		
	}

	//선택한 댓글 조회
	@Override
	public ReplyVO selectReply(int bno) throws Exception {
		return dao.selectReply(bno);
	}

}
