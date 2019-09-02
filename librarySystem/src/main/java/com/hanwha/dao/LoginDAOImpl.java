package com.hanwha.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanwha.dto.MemberDTO;

@Repository
public class LoginDAOImpl implements LoginDAO{
	
	@Autowired
	SqlSession session;
	String namespace = "com.hanwha.login.";
	
	@Override
	public String selectPw(MemberDTO dto) {
		return session.selectOne(namespace+"selectPw", dto.getMemberId());
	}
	
}
