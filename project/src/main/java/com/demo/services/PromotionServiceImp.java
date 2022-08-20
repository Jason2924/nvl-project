package com.demo.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Promotion;
import com.demo.repositories.PromotionRepository;

@Service("promotionService")
public class PromotionServiceImp implements PromotionService {

	@Autowired
	private PromotionRepository promotionRepository;

//	NANG
	@Override
	public List<Promotion> retrieveAll() {
		return promotionRepository.retrieveAll();
	}
	
	@Override
	public List<Promotion> retrieveByDate(Date date) {
		return promotionRepository.retrieveByDate(date);
	}

	// VIET
	@Override
	public Iterable<Promotion> findAll() {
		return promotionRepository.findAll();
	}
	
	@Override
	public List<Promotion> findAll(boolean status) {
		return promotionRepository.findAll(status);
	}
	
	@Override
	public List<Promotion> findAllByMonth(int month) {
		return promotionRepository.findAllByMonth(month);
	}

	@Override
	public Promotion findById(int promotionId) {
		return promotionRepository.findById(promotionId).get();
	}

	@Override
	public Promotion save(Promotion promotion) {
		return promotionRepository.save(promotion);
	}
}
