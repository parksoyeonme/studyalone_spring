package kr.co.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.service.BoardServiceImpl;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.PageMaker;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	// 게시판 글 작성 화면
	@GetMapping("/writeView")
	public void writeView() throws Exception{
		log.info("writeView");
		
	}
	
	// 게시판 글 작성
	@PostMapping("/write")
	public String write(BoardVO boardVO, RedirectAttributes redirectAttr) throws Exception{
		log.info("write");
		
		service.write(boardVO);
		
		
//		int result = service.write(boardVO);
//		String msg = result > 0 ? "게시글 등록 성공!" : "게시글 등록 실패";
//		redirectAttr.addFlashAttribute("msg", msg);
		
		return "redirect:/";
	}
	
	//게시판 목록 조회
	@GetMapping("/list")
//	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		log.info("list");
		
		model.addAttribute("list",service.list(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	//게시물 조회
	@GetMapping("/readView")
	public String read(BoardVO boardVO, Model model) throws Exception{
		log.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		
		return "board/readView";
		
	}
	
	
	// 게시판 수정뷰
	@GetMapping("/updateView")
	public String updateView(BoardVO boardVO, Model model) throws Exception{
		log.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		
		return "board/updateView";
	}
		
	//게시물 수정
	@PostMapping("/update")
	public String update(BoardVO boardVO) throws Exception{
		log.info("update");
		
		service.update(boardVO);
		
		return "redirect:/board/list";
		
	}
	
	//게시물 삭제
	@PostMapping("/delete")
	public String delete(BoardVO boardVO) throws Exception{
		log.info("delet");
		
		service.delete(boardVO.getBno());
		
		return "redirect:/board/list";
	}
	

}
