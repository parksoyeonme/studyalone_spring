package kr.co.controller.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.board.BoardService;
import kr.co.service.board.BoardServiceImpl;
import kr.co.service.reply.ReplyService;
import kr.co.vo.board.BoardVO;
import kr.co.vo.reply.ReplyVO;
import kr.co.vo.utils.Criteria;
import kr.co.vo.utils.PageMaker;
import kr.co.vo.utils.SearchCriteria;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private ServletContext servletContext;
	
	// 게시판 글 작성 화면
	@GetMapping("/writeView")
	public void writeView() throws Exception{
		log.info("writeView");
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		log.info("write");
		service.write(boardVO, mpRequest);
		
		return "redirect:/board/list";
	}
	
	//게시판 목록 조회
	@GetMapping("/list")
//	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		log.info("list");
		
		model.addAttribute("list",service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	//게시물 조회
	@GetMapping("/readView")
	public String read(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		log.info("read");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		
		return "board/readView";
		
	}
	
	
	// 게시판 수정뷰
	@GetMapping("/updateView")
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		log.info("updateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<Map<String, Object>> fileList = service.selectFileList(boardVO.getBno());
		model.addAttribute("file", fileList);
		
		return "board/updateView";
	}
		
	//게시물 수정
	@PostMapping("/update")
	public String update(BoardVO boardVO, 
			 @ModelAttribute("scri") SearchCriteria scri, 
			 RedirectAttributes rttr,
			 @RequestParam(value="fileNoDel[]") String[] files,
			 @RequestParam(value="fileNameDel[]") String[] fileNames,
			 MultipartHttpServletRequest mpRequest) throws Exception {
		log.info("update");
		service.update(boardVO, files, fileNames, mpRequest);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
		
	}
	
	//게시물 삭제
	@PostMapping("/delete")
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception{
		log.info("delet");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//댓글작성
	@PostMapping("/replyWrite")
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		log.info("reply Write");
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	//댓글수정GET
	@GetMapping("/replyUpdateView")
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		log.info("reply Write");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	//댓글 수정 POST
	@PostMapping("replyUpdate")
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		log.info("reply Write");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	//댓글삭제 GET
	@GetMapping("replyDeleteView")
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		log.info("reply Write");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		

		return "board/replyDeleteView";
	}
	
	//댓글삭제 POST
	@PostMapping("replyDelete")
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		log.info("reply Write");
		
		replyService.deleteReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	@RequestMapping(value="/fileDown")
	//response는 서버에서 jsp화면으로 응답할때
	//request는 jsp화면에서 서버로 요청할 때
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception{
		Map<String, Object> resultMap = service.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	

}
