package com.demo.services;

import java.util.Date;
import java.util.List;

import com.demo.entities.Promotion;

public interface PromotionService {
	// NANG
	public List<Promotion> retrieveAll();
	
	public List<Promotion> retrieveByDate(Date date);

	// VIET
	public Iterable<Promotion> findAll();
	
	public List<Promotion> findAll(boolean status);
	
	public List<Promotion> findAllByMonth(int month);

	public Promotion findById(int promotionId);

	public Promotion save(Promotion promotion);
}
