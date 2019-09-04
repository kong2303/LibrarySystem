package com.hanwha.dao;

import java.util.List;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.MemberDTO;

public interface BookDAO {
	
	public String selectPw(MemberDTO dto);
	
	public int insertMember(MemberDTO dto);
	
	public MemberDTO getMember(String memberId);
	
	public int updateMember(MemberDTO dto);
	
	public List<BookDTO> getBookList();
	
	public int insertBook(BookDTO dto);
}
