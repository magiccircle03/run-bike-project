package com.teamrun.runbike;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value=("/"), method=RequestMethod.GET)
public class HomeController {

	public String index() {
		System.out.println("인덱스라능");
		return "";
	}
}
