package com.hanwha.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanwha.dao.LoginDAOImpl;
import com.hanwha.dto.MemberDTO;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Autowired
	LoginDAOImpl dao;
	
	@Override
	public int loginPro(String id, String pw) {
		
		// 아이디가 없으면 1, 비밀번호가 틀리면 2
		// 로그인 성공하면 0
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(id);
		dto.setPassword(pw);
		
		String checkPw = dao.selectPw(dto);
		
		int result = 0;
		if(checkPw == null) {
			result = 1;
		} else if(!checkPw.equals(pw)) {
			result = 2;
		}
		
		return result;
	}
	
}
