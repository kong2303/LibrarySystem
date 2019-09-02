package com.hanwha.dao;

import com.hanwha.dto.MemberDTO;

public interface LoginDAO {
	
	public String selectPw(MemberDTO dto);
	
}
