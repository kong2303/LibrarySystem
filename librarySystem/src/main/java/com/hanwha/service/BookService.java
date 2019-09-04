package com.hanwha.service;

import java.util.List;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.CreateMemberDTO;
import com.hanwha.dto.MemberDTO;

public interface BookService {
	
	public int loginPro(String id, String pw);
	
	public int checkDup(String memberId);
	
	public int insertMember(CreateMemberDTO dto);
	
	public MemberDTO getMember(String memberId);
	
	public int updateMember(CreateMemberDTO dto);
	
	public List<BookDTO> getBookList();
	
	public int insertBook(BookDTO dto);
	
}
