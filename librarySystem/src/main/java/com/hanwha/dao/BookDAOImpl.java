package com.hanwha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.MainContentDTO;
import com.hanwha.dto.MemberDTO;
import com.hanwha.dto.RentListDTO;

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

	@Override
	public BookDTO getBook(int bookNo) {
		return session.selectOne(namespace+"getBook", bookNo);
	}

	@Override
	public int updateBook(BookDTO dto) {
		return session.update(namespace+"updateBook", dto);
	}

	@Override
	public int insertRent(RentListDTO dto) {
		return session.insert(namespace+"insertRent", dto);
	}

	@Override
	public int updateBookStock(RentListDTO dto) {
		return session.update(namespace+"updateBookStock", dto);
	}

	@Override
	public List<RentListDTO> getRentList(String memberId) {
		return session.selectList(namespace+"getRentList", memberId);
	}

	@Override
	public int returnBook(int rNo) {
		return session.update(namespace+"returnBook", rNo);
	}

	@Override
	public RentListDTO getBookInfo(int rNo) {
		return session.selectOne(namespace+"getBookInfo", rNo);
	}
	
	@Override
	public int updateBookStock2(RentListDTO dto) {
		return session.update(namespace+"updateBookStock2", dto);
	}

	@Override
	public List<RentListDTO> getRentRecord(String memberId) {
		return session.selectList(namespace+"getRentRecord", memberId);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return session.selectList(namespace+"getMemberList");
	}

	@Override
	public List<MainContentDTO> getRentRecordAll() {
		return session.selectList(namespace+"getRentRecordAll");
	}

	@Override
	public List<MainContentDTO> getRentById(String memberId) {
		return session.selectList(namespace+"getRentById", memberId);
	}
	
}
