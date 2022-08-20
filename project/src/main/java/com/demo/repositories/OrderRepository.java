package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Order;

@Repository("orderRepository")
public interface OrderRepository extends CrudRepository<Order, Integer> {

	// NANG
	@Query("SELECT MAX(id) FROM Order")
	public long max();

	@Query("FROM Order WHERE accountId = :accountId ORDER By id desc")
	public List<Order> retrieveAllByAccount(@Param("accountId") int accountId);
	
	@Query(value = "SELECT * FROM `order` AS o INNER JOIN payment AS p ON o.id = p.orderId WHERE o.status = 'Awaiting' "
			+ "AND p.status = 1 AND p.method = 'Pay by paypal'", nativeQuery=true)
	public List<Order> retrieveOrderPaypalPayment();

	// VIET
	@Query("FROM Order WHERE status = :status")
	public List<Order> findAllByStatus(@Param("status") String status);

	@Query(value = "SELECT * FROM `order` WHERE MONTH(createdDate) = :month AND YEAR(createdDate) = :year", nativeQuery = true)
	public List<Order> findAllByMonth(@Param("month") int month, @Param("year") int year);

}
