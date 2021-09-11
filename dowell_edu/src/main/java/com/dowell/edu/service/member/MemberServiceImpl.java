package com.dowell.edu.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.member.MemberDAO;
import com.dowell.edu.vo.member.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberServiceImpl implements MemberService {

		@Autowired
		private MemberDAO memberDao;

		//로그인
		@Override
		public MemberVO loginUser(MemberVO memberVo) throws Exception {
			return memberDao.loginUser(memberVo);
		}
}
