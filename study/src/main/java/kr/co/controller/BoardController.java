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
	public String list(Model model) throws Exception{
		log.info("list");
		
		model.addAttribute("list",service.list());
		
		
		return "board/list";
		
	}

}
