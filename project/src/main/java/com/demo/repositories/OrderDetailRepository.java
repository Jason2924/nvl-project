package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.OrderDetail;

@Repository("orderDetailRepository")
public interface OrderDetailRepository extends CrudRepository<OrderDetail, Integer> {

	// VIET
	@Query("FROM OrderDetail WHERE order.id = :orderId")
	public List<OrderDetail> findAllByOrderId(@Param("orderId") int orderId);

	@Query(value = "SELECT productId FROM order_detail AS od INNER JOIN `order` AS o ON od.orderId = o.id "
			+ "WHERE o.status = 'Accepted' GROUP BY productId ORDER BY COUNT(*) DESC LIMIT 1", nativeQuery = true)
	public int getMostProductId();

	@Query(value = "SELECT COUNT(*) FROM order_detail AS od INNER JOIN `order` AS o ON od.orderId = o.id " 
			+ "WHERE o.status = 'Accepted' GROUP BY productId ORDER BY COUNT(*) DESC LIMIT 1", nativeQuery = true)
	public int getMostProductQuantity();
	
	@Query(value="SELECT SUM(price) from order_detail AS od INNER JOIN product AS p ON od.productId = p.id "
			+ "INNER JOIN `order` AS o ON od.orderId = o.id WHERE o.status = 'Accepted' "
			+ "GROUP BY p.brandId ORDER BY SUM(price) DESC LIMIT 1", nativeQuery = true)
	public double getTotalMaxPriceByBrand();
	
	@Query(value="SELECT p.brandId from order_detail AS od INNER JOIN product AS p ON od.productId = p.id "
			+ "INNER JOIN `order` AS o ON od.orderId = o.id WHERE o.status = 'Accepted' "
			+ "GROUP BY p.brandId ORDER BY SUM(price) DESC LIMIT 1", nativeQuery = true)
	public int getBrandIdByMaxPrice();
	
}
