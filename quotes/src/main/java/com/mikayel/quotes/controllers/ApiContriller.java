package com.mikayel.quotes.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController

public class ApiContriller {
	
	
	@GetMapping("/api/quotes")
	
		public String apiStuff() {
		String url = "https://zenquotes.io/api/today";
		RestTemplate tempale = new RestTemplate();
		String result = tempale.getForObject(url, String.class);
		return result;
	}
}
