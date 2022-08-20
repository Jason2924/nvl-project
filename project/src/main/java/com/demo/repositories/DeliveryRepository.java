package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Delivery;

@Repository("deliveryRepository")
public interface DeliveryRepository extends CrudRepository<Delivery, Integer> {
	// VIET
	@Query("FROM Delivery WHERE status = :status")
	public List<Delivery> findAllByStatus(@Param("status") String status);

	@Query("FROM Delivery WHERE order.id = :orderId")
	public Delivery findByOrderId(@Param("orderId") int orderId);

}
