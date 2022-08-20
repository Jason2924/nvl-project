package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Exchange;

@Repository("exchangeRepository")
public interface ExchangeRepository extends CrudRepository<Exchange, Integer> {
	// VIET
	@Query(value = "SELECT * FROM exchange WHERE MONTH(createdDate) = :month", nativeQuery = true)
	public List<Exchange> findAllByMonth(@Param("month") int month);
}
