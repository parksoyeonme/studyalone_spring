package com.dowell.edu.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dowell.edu.service.member.MemberService;
import com.dowell.edu.vo.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	 @RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginUser(MemberVO memberVo, HttpServletRequest request, 
													RedirectAttributes rttr) throws Exception{
			log.info("post login");
			
			HttpSession session = request.getSession();
			MemberVO login = memberService.loginUser(memberVo);
			
			if(login == null) {
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			}else {
				session.setAttribute("member", login);
			}
			
			return "redirect:/";
		}
		
		@RequestMapping(value = "/logout", method = RequestMethod.GET)
		public String logoutUser(HttpSession session) throws Exception{
			
			session.invalidate();
			
			return "redirect:/";
		}

}
