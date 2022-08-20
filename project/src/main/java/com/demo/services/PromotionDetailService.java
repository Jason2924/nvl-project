package com.demo.services;

import java.util.List;

import com.demo.entities.PromotionDetail;

public interface PromotionDetailService {

	// VIET
	public Iterable<PromotionDetail> findAll();
	
	public List<PromotionDetail> findAllByPromotionId(int promotionId);

	public List<PromotionDetail> findAllByProductId(int productId);
}
