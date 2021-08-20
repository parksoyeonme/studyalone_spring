package kr.co.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return null;
	}
}
