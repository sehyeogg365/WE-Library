package com.marondal.welibrary.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	@ResponseBody
	@GetMapping("/hello")
	public String helloWorld() {
		
		return "Hello World!!";
	}

	@GetMapping("/hello/jsp")
	public String helloJSP() {
		return "hello";
	}
}
