package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.PromotionDetail;
import com.demo.repositories.PromotionDetailRepository;

@Service("promotionDetailServiceImp")
public class PromotionDetailServiceImpl implements PromotionDetailService {

	@Autowired
	private PromotionDetailRepository promotionDetailRepository;

	// VIET
	@Override
	public Iterable<PromotionDetail> findAll() {
		return promotionDetailRepository.findAll();
	}

	@Override
	public List<PromotionDetail> findAllByPromotionId(int promotionId) {
		return promotionDetailRepository.findAllByPromotionId(promotionId);
	}

	@Override
	public List<PromotionDetail> findAllByProductId(int productId) {
		return promotionDetailRepository.findAllByProductId(productId);
	}

}
