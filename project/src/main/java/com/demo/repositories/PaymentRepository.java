package com.demo.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Payment;

@Repository("paymentRepository")
public interface PaymentRepository extends CrudRepository<Payment, Integer> {
	// NANG
	@Query("FROM Payment WHERE id = :id")
	public Payment retrieveById(int id);

	// VIET
	@Query("FROM Payment WHERE order.id = :orderId")
	public Payment findByOrderId(@Param("orderId") int orderId);

}
