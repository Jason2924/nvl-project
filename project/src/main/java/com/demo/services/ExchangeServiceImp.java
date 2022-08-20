package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Exchange;
import com.demo.repositories.ExchangeRepository;

@Service("exchangeService")
public class ExchangeServiceImp implements ExchangeService {

	@Autowired
	private ExchangeRepository exchangeRepository;

	@Override
	public Exchange save(Exchange exchange) {
		return exchangeRepository.save(exchange);
	}

	// VIET
	@Override
	public Iterable<Exchange> findAll() {
		return exchangeRepository.findAll();
	}

	@Override
	public List<Exchange> findAllByMonth(int month) {
		return exchangeRepository.findAllByMonth(month);
	}
}
