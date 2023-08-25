package com.example.demo.blog;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/blog")
public class BlogController {
//	private BlogDao bDao = new BlogDao();
//	@Autowired private BlogDao bDao;		// Spring에서 BlogDao() 객체를 생성해서 inject
	@Autowired private BlogService bDao;    // BlogSernice 인터페이스, bDao 구현객체를 스프링이 넣어줌
	
	
	@GetMapping("/list")
	public String list(@RequestParam(name="f", defaultValue="title") String field,
			@RequestParam(name="q", defaultValue="") String query,
			Model model) {
		List<Blog> list = bDao.getBlogList(field, query);
		model.addAttribute("blogList", list);
		model.addAttribute("menu", "blog");
		model.addAttribute("field", field);
		model.addAttribute("query", query);
		return "blog/list";
	}
	
	@GetMapping("/write")
	public String writeForm(Model model) {
		model.addAttribute("menu", "blog");
		return "blog/write";
	}
	
	@PostMapping("/write")
	public String writeProc(Blog blog) {										// 이렇게 쓸 수도 있지만
//		public String writeProc(String penName, String title, String content) { // 이렇게 쓸 수도 있음
//		Blog blog = new Blog(penName, title, content);
		bDao.insertBlog(blog);
		return "redirect:/blog/list";
	}
	
	@GetMapping("/detail/{bid}")
	public String detail(@PathVariable int bid, String option, Model model) {
		if(option == null || option.equals(""))
		bDao.increaseViewCount(bid); 		// DNI option 이 설정되어 있으면 조회수를 증가 시키지 않음
		Blog blog = bDao.getBlog(bid);
		model.addAttribute("blog",blog);
		model.addAttribute("menu","blog");
		return "blog/detail";
	}
	
	@GetMapping("/update/{bid}") //
	public String updateForm(@PathVariable int bid, Model model) {
		Blog blog = bDao.getBlog(bid);
		model.addAttribute("blog",blog);
		model.addAttribute("menu","blog");
		return "blog/update";
	}
	
	@PostMapping("/update")
	public String updateProc(Blog blog) {     // 이렇게 쓸 수도 있지만 
//	public String updateProc(String penName, String title, String content) {	이렇게 쓸 수도 있음
//		Blog blog = new Blog(penName, title, content);
		bDao.updateBlog(blog);
		return "redirect:/blog/detail/" +blog.getBid() + "?option=DNI"; //"?option=DNI" 있으면 수정 했을 때 조회수 증가 X , 없으면 수정도 조회수에 들어감
	}
	@GetMapping("/delete/{bid}") //
	public String delete(@PathVariable int bid, Model model) {
		model.addAttribute("bid",bid);   // model.addAttribute("bid",bid); 이렇게 사용해도 됨 
		model.addAttribute("menu","blog");
		return "blog/delete";
	
	}
	
	@GetMapping("/deleteConfirm/{bid}")
	public String deleteConfirm(@PathVariable int bid) {
		bDao.deleteBlog(bid);
		return "redirect:/blog/list";
	}
}