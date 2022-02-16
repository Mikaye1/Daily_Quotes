package com.solo.quote.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.solo.quote.models.Quote;

@Repository
public interface QuoteRepository extends CrudRepository<Quote, Long>{
	List<Quote> findAll();

}

