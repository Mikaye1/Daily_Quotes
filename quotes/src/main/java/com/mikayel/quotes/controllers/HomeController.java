package com.mikayel.quotes.controllers;




import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mikayel.quotes.models.Quote;
import com.mikayel.quotes.models.User;
import com.mikayel.quotes.services.QuoteService;
import com.mikayel.quotes.services.UserService;
import com.mikayel.quotes.validators.UserValidator;

@Controller
public class HomeController {
	@Autowired
	private UserService uService;
	@Autowired
	private QuoteService qService;
	@Autowired
	private UserValidator validators;
	
	@GetMapping("/")
	public String dashboard(@ModelAttribute("user") User user) {
		return "dashboard.jsp";
	}
	@PostMapping("/registration")
	public String reg(@Valid @ModelAttribute("user") User user, 
			BindingResult result, HttpSession session) {
		validators.validate(user, result);
		if(result.hasErrors()) {
			return "dashboard.jsp";
		}
		else {
		User newUser = uService.registerUser(user);
		session.setAttribute("userId", newUser.getId());
		return "redirect:/allQuotes";
		}
	}
	@GetMapping("/allQuotes")
	public String projects(Model model, HttpSession session) {
		
//		API call
		String url = "https://zenquotes.io/api/random";
		RestTemplate tempale = new RestTemplate();

		String result = tempale.getForObject(url, String.class);
		
//		JSONParser parser = new JSONParser();  
//		JSONObject json = (JSONObject) parser.parse(stringToParse);  
		
		
		if (session.getAttribute("userId") != null) {
			List<Quote> quotes = this.qService.getAll();
			
			//Get user from session
			User user = uService.findUserById((Long) session.getAttribute("userId"));
			model.addAttribute("quote", quotes);
			model.addAttribute("user", user);
			model.addAttribute("allQuotes", this.qService.getAll());
			model.addAttribute("qOfTheDay", result);
			return "allQuotes.jsp";
		}
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("email") String uEmail, 
			@RequestParam("password") String pass, Model model, 
			HttpSession session, RedirectAttributes rA) {
		if(uService.authenticateUser(uEmail, pass)) {
			User nUser = uService.findByEmail(uEmail);
			session.setAttribute("userId", nUser.getId());
			return "redirect:/allQuotes";
		}
		else {
			rA.addFlashAttribute("error", "Wrong email or pass!");
			return "redirect:/";
		}
	}
	
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
    	session.invalidate();
        // redirect to login page
    	return "redirect:/";
    }
    
    
    
    @GetMapping("/newQuote")
    public String createQuote(@ModelAttribute("newQuote") Quote quote) {
    	return "newQuote.jsp";
    }
    
    @PostMapping("/newQuote")
    public String createQuote(@Valid 
    		@ModelAttribute("newQuote") Quote quote, BindingResult result) {
		if(result.hasErrors()) {
			return "newQuote.jsp";
		}
		else{
    	this.qService.createQuote(quote);
    	return "redirect:/allQuotes";
		}
    }
    
	@GetMapping("/quotes/like/{id}")
	public String like(@PathVariable("id") Long id, HttpSession mysession) {
		Long userId=(Long)mysession.getAttribute("userId");
		User user = uService.getOne(userId);
		Quote quote = qService.getOne(id);
		qService.addLikes(quote, user);
		return "redirect:/allQuotes";
	}
	
	@GetMapping("/quotes/unLike/{id}")
	public String unLike(@PathVariable("id") Long id, HttpSession mysession) {
		Long userId=(Long)mysession.getAttribute("userId");
		User user = uService.getOne(userId);
		Quote quote = qService.getOne(id);
		qService.unLikes(quote, user);
		return "redirect:/allQuotes";
	}
	
	
	
	 
		@GetMapping("/edit/{id}")
		public String edit(@PathVariable("id") Long id, 
				@ModelAttribute("editQuote") Quote quote, Model model) {
			model.addAttribute("oneQuote", this.qService.getOne(id));		
			return "edit.jsp";
		}
	    
	    @PostMapping("/edit/{id}")
	    public String update(@Valid @ModelAttribute("editQuote") Quote quote, 
	    		BindingResult result,
				@PathVariable("id") Long id) {
	    	if(result.hasErrors()) {
				return "edit.jsp";
			}
	    	else {
			this.qService.updt(quote);
			return "redirect:/allQuotes";
	    	}
	    }
	    
		@DeleteMapping("/delete/{id}")
		public String delete(@PathVariable("id") Long id) {
			this.qService.delete(id);
			return "redirect:/allQuotes";
		}
}
