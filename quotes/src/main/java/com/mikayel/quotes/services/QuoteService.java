package com.mikayel.quotes.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mikayel.quotes.models.Quote;
import com.mikayel.quotes.models.User;
import com.mikayel.quotes.repositories.QuoteRepository;

@Service
public class QuoteService {
	
	@Autowired
	private QuoteRepository qRepo;
	
	public List<Quote> getAll(){
		return this.qRepo.findAll();
		}
	
	public Quote createQuote(Quote quote) {
		return this.qRepo.save(quote);
	}
	
	public void delete(Long id) {
		this.qRepo.deleteById(id);
	}
	
	public Quote getOne(Long id) {
		return this.qRepo.findById(id).orElse(null);
	}
	
	public Quote updt(Quote quote) {
		return this.qRepo.save(quote);
	}
	
	public void addLikes(Quote quote, User user){
		List<User> myLikers = quote.getLikers();
		myLikers.add(user);
		qRepo.save(quote);
	}
	
	public void unLikes(Quote quote, User user){
		List<User> myLikers = quote.getLikers();
		myLikers.remove(user);
		qRepo.save(quote);
	}

}
