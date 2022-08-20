package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.PromotionDetail;

@Repository("promotionDetailRepository")
public interface PromotionDetailRepository extends CrudRepository<PromotionDetail, Integer> {

	// VIET
	@Query("FROM PromotionDetail WHERE promotion.id = :promotionId")
	public List<PromotionDetail> findAllByPromotionId(@Param("promotionId") int promotionId);

	@Query("FROM PromotionDetail WHERE product.id = :productId")
	public List<PromotionDetail> findAllByProductId(@Param("productId") int productId);
}
