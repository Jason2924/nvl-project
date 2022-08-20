package com.demo.services;

import java.util.List;

import com.demo.entities.Price;

public interface PriceService {
	// VIET
	public List<Price> findAll(boolean status);

	public List<Price> findAllByProductId(int productId, boolean status);

	public List<Price> findAllByMonth(int month);

	public Price find(int id);

	public Price save(Price price);

	public Price findByProductId(int productId, boolean status);

}
