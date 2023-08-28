package com.example.demo.chinadrama;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.blog.Blog;

@Controller
@RequestMapping("/drama")
public class Dramacontroller {
	@Autowired private DramaService dramaService;
	
	@GetMapping("/list")
	public String list(@RequestParam(name="f", defaultValue = "title") String field,
			@RequestParam(name="q", defaultValue = "") String query,
			Model model) {
		List<Drama> list = dramaService.getDramaList(field, query);
		model.addAttribute("dramaList", list);
		model.addAttribute("menu", "drama");
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		return "drama/list";
	}
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		model.addAttribute("menu", "drama");
		return "drama/write";
	}
	
	@PostMapping("/write")
	public String writeProc(Drama drama) {
		dramaService.insertDrama(drama);
		return "redirect:/drama/list";
	}
	
	@GetMapping("/detail/{no}")
	public String detail(@PathVariable int no, String option, Model model) {
		if(option == null || option.equals(""))
		dramaService.increaseViewCount(no);
		Drama drama = dramaService.getdrama(no);
		model.addAttribute("drama",drama);
		model.addAttribute("menu","drama");
		return "drama/detail";
		
		
	}
}
