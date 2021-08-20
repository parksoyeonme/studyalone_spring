package kr.co.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.member.MemberService;
import kr.co.vo.member.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	//회원가입 get
	@GetMapping("/register")
	public void getRegister() throws Exception {
		log.info("get register");
	}
	
	//회원가입 post
	@PostMapping("/register")
	public String postRegister(MemberVO memberVo) throws Exception {
		log.info("post register");
		
		memberService.register(memberVo);
		
		return "redirect:/";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(MemberVO memberVo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		log.info("post login");
		
		HttpSession session = req.getSession();
		MemberVO login = memberService.login(memberVo);
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		
		return "redirect:/";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception{
			
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원정보 수정화면
	@GetMapping("/memberUpdateView")
	public String registerUpdateView() throws Exception{
		
		return "member/memberUpdateView";
	}
	
	//회원정보 수정
	@PostMapping("/memberUpdate")
	public String registerUpdate(MemberVO memberVo, HttpSession session) throws Exception{
		
		memberService.memberUpdate(memberVo);
		
		session.invalidate();
		
		return "redirect:/";
	}
}
