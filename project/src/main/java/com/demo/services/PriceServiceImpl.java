package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Price;
import com.demo.repositories.PriceRepository;

@Service("priceService")
public class PriceServiceImpl implements PriceService {
	@Autowired
	private PriceRepository priceRepository;

	@Override
	public List<Price> findAll(boolean status) {
		return priceRepository.findAll(status);
	}

	@Override
	public List<Price> findAllByProductId(int productId, boolean status) {
		return priceRepository.findAllByProductId(productId, status);
	}

	@Override
	public List<Price> findAllByMonth(int month) {
		return priceRepository.findAllByMonth(month);
	}

	@Override
	public Price find(int id) {
		return priceRepository.findById(id).get();
	}

	@Override
	public Price save(Price price) {
		return priceRepository.save(price);
	}

	@Override
	public Price findByProductId(int productId, boolean status) {
		return priceRepository.findByProductId(productId, status);
	}

}
