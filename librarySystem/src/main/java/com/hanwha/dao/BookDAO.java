package com.hanwha.dao;

import java.util.List;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.MainContentDTO;
import com.hanwha.dto.MemberDTO;
import com.hanwha.dto.RentListDTO;

public interface BookDAO {
	
	public String selectPw(MemberDTO dto);
	
	public int insertMember(MemberDTO dto);
	
	public MemberDTO getMember(String memberId);
	
	public int updateMember(MemberDTO dto);
	
	public List<BookDTO> getBookList();
	
	public int insertBook(BookDTO dto);
	
	public BookDTO getBook(int bookNo);
	
	public int updateBook(BookDTO dto);
	
	public int insertRent(RentListDTO dto);
	
	public int updateBookStock(RentListDTO dto);
	
	public List<RentListDTO> getRentList(String memberId);
	
	public int returnBook(int rNo);
	
	public RentListDTO getBookInfo(int rNo);
	
	public int updateBookStock2(RentListDTO dto);
	
	public List<RentListDTO> getRentRecord(String memberId);
	
	public List<MemberDTO> getMemberList();
	
	public List<MainContentDTO> getRentRecordAll();
	
	public List<MainContentDTO> getRentById(String memberId);
}
