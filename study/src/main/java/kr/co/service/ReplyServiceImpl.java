package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.ReplyDAO;
import kr.co.vo.ReplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO dao;
	
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

}
