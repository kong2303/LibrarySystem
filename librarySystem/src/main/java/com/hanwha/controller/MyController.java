package com.hanwha.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanwha.service.LoginService;

@Controller
public class MyController {

	@Autowired
	LoginService loginService;
	
	@RequestMapping("/login/loginPage")
	public String loginPage(HttpServletRequest req) {
				
		return "login/loginPage";
	}
	
	@RequestMapping("/login/createMember")
	public String createMember() {
		
		return "login/createMember";
	}
	
	@RequestMapping("/login/loginPro")
	public String loginPro(String id, String pw, Model model) {
		
		model.addAttribute("result", loginService.loginPro(id, pw));
		model.addAttribute("memberId", id);
		
		return "login/loginPro";
	}
	
	@RequestMapping("/member/main")
	public String main() {
		
		return "member/main";
	}
	
}
