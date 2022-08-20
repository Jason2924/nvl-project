package com.demo.services;

import java.util.List;

import com.demo.entities.Exchange;

public interface ExchangeService {
	
	public Exchange save(Exchange exchange);
	
	// VIET
	public Iterable<Exchange> findAll();
	
	public List<Exchange> findAllByMonth(int month);
}
