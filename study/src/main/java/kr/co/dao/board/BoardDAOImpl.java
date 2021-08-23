package kr.co.dao.board;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.board.BoardVO;
import kr.co.vo.utils.Criteria;
import kr.co.vo.utils.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession session;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		session.insert("board.insert", boardVO);
		
	}
	
	// 게시물 목록 조회
	@Override
//	public List<BoardVO> list(Criteria cri) throws Exception {
//	
//		return session.selectList("board.listPage", cri);
//
//	}
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return session.selectList("board.listPage", scri);

	}
	
	//게시물 총 갯수
	@Override
//	public int listCount() throws Exception {
//	
//		return session.selectOne("board.listCount");
//	}
	public int listCount(SearchCriteria scri) throws Exception {
		
		return session.selectOne("board.listCount", scri);
	}

	//게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return session.selectOne("board.read", bno);
	}

	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		session.update("board.update", boardVO);
		
	}

	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		session.delete("board.delete", bno);
		
	}
	
	//첨부파일 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		session.insert("board.insertFile", map);
	}

	
	
	
}
