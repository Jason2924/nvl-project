package com.demo.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Promotion;

@Repository("promotionRepository")
public interface PromotionRepository extends CrudRepository<Promotion, Integer> {
	// NANG
	@Query("FROM Promotion WHERE status = 1")
	public List<Promotion> retrieveAll();

	@Query("FROM Promotion WHERE :date BETWEEN startDate AND endDate AND status = 1")
	public List<Promotion> retrieveByDate(@Param("date") Date date);

	// VIET
	@Query("FROM Promotion WHERE status = :status")
	public List<Promotion> findAll(@Param("status") boolean Status);

	@Query(value = "SELECT * FROM promotion WHERE MONTH(startDate) = :month", nativeQuery = true)
	public List<Promotion> findAllByMonth(@Param("month") int month);
}
