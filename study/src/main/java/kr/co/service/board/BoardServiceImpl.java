package kr.co.service.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.board.BoardDAO;
import kr.co.util.FileUtils;
import kr.co.vo.board.BoardVO;
import kr.co.vo.utils.Criteria;
import kr.co.vo.utils.SearchCriteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Autowired
	private BoardDAO dao;
	
	
	
	//게시물 작성
//	@Override
//	public void write(BoardVO boardVO) throws Exception {
//		dao.write(boardVO);
//	}
	//게시물작성 + 첨부파일
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(boardVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}

	// 게시물 목록 조회
	@Override
//	public List<BoardVO> list(Criteria cri) throws Exception {
//
//		return dao.list(cri);
//	}
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}

	//게시물 총 갯수
	@Override
//	public int listCount() throws Exception {
//		return dao.listCount();
//	}
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	//게시물 조회
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}

	//게시물 수정
	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}

	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}


	
}
