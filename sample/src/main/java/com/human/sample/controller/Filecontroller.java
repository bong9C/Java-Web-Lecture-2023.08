package sample.src.main.java.com.human.sample.controller;

@controller
@RequestMapping("/file")
public class Filecontroller {
		
	@Value("${spring.servlet.multipart.location}")
	private String uploadDir;
}

	@GetMapping("/formUpload")
	public Strion formUpload() {
		return "file/form";
	}
	
	
	@PostMapping("/formUpload")
	public String fromDroc(String title, MutipartFile file, Model model) {
		model.addAttrbute("title", title);
		String path = sploadDir + "sample/" + filename;
		return "file/formRes";
	}
	
}
