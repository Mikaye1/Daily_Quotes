package com.mikayel.quotes.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.mikayel.quotes.models.Quote;
@Repository
public interface QuoteRepository extends CrudRepository<Quote, Long>{
	List<Quote> findAll();

}
