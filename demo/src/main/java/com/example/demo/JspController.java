package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/jsp")//주소 불러오기 
public class JspController {
	
	@GetMapping("/sample")
	public String sample() {
		return "jsp/sample";
	}
	
	@GetMapping("/schedule")
	public String schedule() {
		return "jsp/schedule";
	}
	
	@GetMapping("elOperator")
	public String elOperator() {
		return "jsp/el1_operator";
	}
	
	@GetMapping("elScope")
	public String elScope(HttpSession session, Model model) {
		session.setAttribute("sName", "sName");
		model.addAttribute("mName","mName");
		session.setAttribute("name", "sName");
		model.addAttribute("name","mName");
		return "jsp/el2_scope";
	}
	
	
}
