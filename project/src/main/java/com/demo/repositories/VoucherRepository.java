package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Voucher;

@Repository("voucherRepository")
public interface VoucherRepository extends CrudRepository<Voucher, Integer> {

	// NANG
	@Query("FROM Voucher WHERE status = 1 AND point <= :point ORDER BY price asc")
	public List<Voucher> retrieveAllByPoint(@Param("point") int point);

	// VIET
	@Query("FROM Voucher WHERE status = :status")
	public List<Voucher> findAll(@Param("status") boolean status);
}
