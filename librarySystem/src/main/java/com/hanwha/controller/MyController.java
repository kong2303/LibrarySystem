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
import com.hanwha.dto.MemberDTO;
import com.hanwha.dto.RentListDTO;
import com.hanwha.service.BookService;

@Controller
public class MyController {

	@Autowired
	BookService service;
	
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
		
		model.addAttribute("result", service.insertMember(dto));
		model.addAttribute("memberId", dto.getMemberId());
		
		return "login/createPro";
	}
	
	@RequestMapping("/login/loginPro")
	public String loginPro(String id, String pw, Model model) {
		
		model.addAttribute("result", service.loginPro(id, pw));
		model.addAttribute("memberInfo", service.getMember(id));
		
		return "login/loginPro";
	}
	
	@RequestMapping("/login/checkDup")
	public String checkDup(String memberId, Model model) {
		
		model.addAttribute("result", service.checkDup(memberId));
		model.addAttribute("memberId", memberId);
		
		return "login/checkDup";
	}
	
	@RequestMapping("/login/logout")
	public String logout(HttpServletRequest request) {
		
		request.getSession().removeAttribute("loginInfo");
		
		return "redirect:/login/loginPage";
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
		
		model.addAttribute("result", service.loginPro(id, pw));
		
		return "member/myInfoDetail";
	}
	
	@RequestMapping("/member/myInfoUpdate")
	public String myInfoUpdate(CreateMemberDTO dto, HttpServletRequest request) {
		
		int result = service.updateMember(dto);
		if(result == 1) {
			request.getSession().removeAttribute("loginInfo");
			request.getSession().setAttribute("loginInfo", service.getMember(dto.getMemberId()));
		}
		return "member/main";
	}
	
	@RequestMapping("/admin/bookStock")
	public String bookStock(Model model) {
		
		model.addAttribute("bookList", service.getBookList());
		
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
		service.insertBook(dto);
		return "redirect:bookStock";
	}
	
	@RequestMapping("/admin/detailBook")
	public String detailBook(int bookNo, Model model) {
		
		model.addAttribute("book", service.detailBook(bookNo));
		
		return "admin/detailBook";
	}
	
	@RequestMapping("/admin/updateBook")
	public String updateBook(BookDTO dto) {
		
		service.updateBook(dto);
		
		return "redirect:bookStock";
	}
	
	@RequestMapping("/member/applyRent")
	public String applyRent(int bookNo, Model model) {
		
		model.addAttribute("book", service.detailBook(bookNo));
		
		return "member/applyRent";
	}
	
	@RequestMapping("/member/applyRentPro")
	public String applyRentPro(RentListDTO dto) {
		
		service.insertRent(dto);
		
		return "redirect:/admin/bookStock";
	}
	
	@RequestMapping("/member/rentBookList")
	public String rentBookList(String memberId, Model model) {
		
		model.addAttribute("rentList", service.getRentList(memberId));

		return "member/rentBookList";
	}
	
	@RequestMapping("/member/returnBook")
	public String returnBook(int[] rNo, HttpServletRequest request) {
		
		String memberId = ((MemberDTO)(request.getSession().getAttribute("loginInfo"))).getMemberId();
		service.returnBook(rNo);
		
		return "redirect:/member/rentBookList?memberId="+memberId;
	}
	
	@RequestMapping("/member/rentRecord")
	public String rentRecord(String memberId, Model model) {
		
		model.addAttribute("rentList",service.getRentRecord(memberId));
		
		return "member/rentRecord";
	}
	
	@RequestMapping("/admin/manageMember")
	public String rentRecord(Model model) {
		
		model.addAttribute("memberList", service.getMemberList());
		
		return "admin/memberList";
	}
}
