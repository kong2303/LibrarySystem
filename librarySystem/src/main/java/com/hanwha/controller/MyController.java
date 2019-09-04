package com.hanwha.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hanwha.dto.BookDTO;
import com.hanwha.dto.CreateMemberDTO;
import com.hanwha.service.BookService;

@Controller
public class MyController {

	@Autowired
	BookService loginService;
	
	@RequestMapping("/login/loginPage")
	public String loginPage(HttpServletRequest req) {
				
		return "login/loginPage";
	}
	
	@RequestMapping("/login/createMember")
	public String createMember() {
		
		return "login/createMember";
	}
	
	@RequestMapping("/login/createPro")
	public String createPro(CreateMemberDTO dto, Model model) {
		
		model.addAttribute("result", loginService.insertMember(dto));
		model.addAttribute("memberId", dto.getMemberId());
		
		return "login/createPro";
	}
	
	@RequestMapping("/login/loginPro")
	public String loginPro(String id, String pw, Model model) {
		
		model.addAttribute("result", loginService.loginPro(id, pw));
		model.addAttribute("memberInfo", loginService.getMember(id));
		
		return "login/loginPro";
	}
	
	@RequestMapping("/login/checkDup")
	public String checkDup(String memberId, Model model) {
		
		model.addAttribute("result", loginService.checkDup(memberId));
		model.addAttribute("memberId", memberId);
		
		return "login/checkDup";
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpServletRequest request) {
		
		request.getSession().removeAttribute("loginInfo");
		
		return "/login/loginPage";
	}
	
	@RequestMapping("/member/main")
	public String main() {
		
		return "member/main";
	}
	
	@RequestMapping("/member/myInfo")
	public String myInfo() {
		
		return "member/myInfo";
	}
	
	@RequestMapping("/member/myInfoCheck")
	public String myInfoCheck(String id, String pw, Model model) {
		
		model.addAttribute("result", loginService.loginPro(id, pw));
		
		return "member/myInfoDetail";
	}
	
	@RequestMapping("/member/myInfoUpdate")
	public String myInfoUpdate(CreateMemberDTO dto, HttpServletRequest request) {
		
		int result = loginService.updateMember(dto);
		if(result == 1) {
			request.getSession().removeAttribute("loginInfo");
			request.getSession().setAttribute("loginInfo", loginService.getMember(dto.getMemberId()));
		}
		return "member/main";
	}
	
	@RequestMapping("/admin/bookStock")
	public String bookStock(Model model) {
		
		model.addAttribute("bookList", loginService.getBookList());
		
		return "admin/bookStock";
	}
	
	@RequestMapping("/admin/insertBook")
	public String insertBook() {
		return "admin/insertBook";
	}
	
	@RequestMapping("/admin/insertBookPro")
	public String insertBookPro(BookDTO dto, HttpServletRequest request) throws Exception{
		
		MultipartFile uploadfile = dto.getUploadfile();
		String path = request.getSession().getServletContext().getRealPath("/resources");
		System.out.println("웹서버의 실제경로" + path);
		String fileName = uploadfile.getOriginalFilename();
		String fpath = path + "\\" + fileName;
		dto.setImage(fileName);
		System.out.println(dto.getBookName());
		System.out.println(dto.getWriter());
		System.out.println(dto.getPublish());
		try {
			File file = new File(fpath);
			uploadfile.transferTo(file);

		} catch (IOException e) {
			e.printStackTrace();
		}
		loginService.insertBook(dto);
		return "redirect:bookStock";
	}
}
