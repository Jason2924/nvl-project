package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Price;

@Repository("priceRepository")
public interface PriceRepository extends CrudRepository<Price, Integer> {

	// VIET
	@Query("FROM Price WHERE status = :status")
	public List<Price> findAll(@Param("status") boolean status);

	@Query("FROM Price WHERE product.id = :productId AND status = :status")
	public List<Price> findAllByProductId(@Param("productId") int productId, @Param("status") boolean status);

	@Query("FROM Price WHERE product.id = :productId AND status = :status")
	public Price findByProductId(@Param("productId") int productId, @Param("status") boolean status);

	@Query(value = "SELECT * FROM price WHERE MONTH(createdDate) = :month", nativeQuery = true)
	public List<Price> findAllByMonth(@Param("month") int month);
}
