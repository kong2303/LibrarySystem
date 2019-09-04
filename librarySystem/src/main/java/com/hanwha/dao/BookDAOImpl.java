package com.hanwha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.MemberDTO;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Autowired
	SqlSession session;
	String namespace = "com.hanwha.login.";
	
	@Override
	public String selectPw(MemberDTO dto) {
		return session.selectOne(namespace+"selectPw", dto.getMemberId());
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return session.insert(namespace+"insertMember", dto);
	}

	@Override
	public MemberDTO getMember(String memberId) {
		return session.selectOne(namespace+"getMember", memberId);
	}

	@Override
	public int updateMember(MemberDTO dto) {
		return session.update(namespace+"updateMember", dto);
	}

	@Override
	public List<BookDTO> getBookList() {
		return session.selectList(namespace+"getBookList");
	}

	@Override
	public int insertBook(BookDTO dto) {
		return session.insert(namespace+"insertBook", dto);
	}
	
}
