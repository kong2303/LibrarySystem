package com.hanwha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanwha.dao.BookDAO;
import com.hanwha.dto.BookDTO;
import com.hanwha.dto.CreateMemberDTO;
import com.hanwha.dto.MainContentDTO;
import com.hanwha.dto.MemberDTO;
import com.hanwha.dto.RentListDTO;

@Service
public class BookServiceImpl implements BookService{
	
	@Autowired
	BookDAO dao;
	
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

	@Override
	public int checkDup(String memberId) {
		
		//중복되면 1, 중복안되면 0
		int result = 0;
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(memberId);
		String checkPw = dao.selectPw(dto);
		if(checkPw != null) {
			result = 1;
		}
		return result;
	}

	@Override
	public int insertMember(CreateMemberDTO dto) {
		MemberDTO memDTO = new MemberDTO();
		memDTO.setMemberId(dto.getMemberId());
		memDTO.setPassword(dto.getPassword());
		memDTO.setMemberName(dto.getMemberName());
		memDTO.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
		
		return dao.insertMember(memDTO);
	}

	@Override
	public MemberDTO getMember(String memberId) {
		return dao.getMember(memberId);
	}

	@Override
	public int updateMember(CreateMemberDTO dto) {
		MemberDTO memDTO = new MemberDTO();
		memDTO.setMemberId(dto.getMemberId());
		memDTO.setPassword(dto.getPassword());
		memDTO.setMemberName(dto.getMemberName());
		memDTO.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
		
		return dao.updateMember(memDTO);
	}

	@Override
	public List<BookDTO> getBookList() {
		return dao.getBookList();
	}

	@Override
	public int insertBook(BookDTO dto) {
		return dao.insertBook(dto);
	}

	@Override
	public BookDTO detailBook(int bookNo) {
		return dao.getBook(bookNo);
	}

	@Override
	public int updateBook(BookDTO dto) {
		return dao.updateBook(dto);
	}

	@Override
	public int insertRent(RentListDTO dto) {
		int result = dao.insertRent(dto);
		if(result == 1) {
			dao.updateBookStock(dto);
		}
		return result;
	}

	@Override
	public List<RentListDTO> getRentList(String memberId) {
		return dao.getRentList(memberId);
	}

	@Override
	public int returnBook(int[] rNo) {
		
		int result = 0;
		for(int i=0; i<rNo.length; i++) {
			int check = dao.returnBook(rNo[i]);
			result += check;
			if(check == 1) {
				dao.updateBookStock2(dao.getBookInfo(rNo[i]));
			}
		}
		return result;
	}

	@Override
	public List<RentListDTO> getRentRecord(String memberId) {
		return dao.getRentRecord(memberId);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public List<MainContentDTO> getMainContent(String memberId) {
		
		List<MainContentDTO> list = null;
		if(memberId.equals("admin")) {
			list = dao.getRentRecordAll();
		} else {
			list = dao.getRentById(memberId);
		}
		
		return list;
	}
	
}
