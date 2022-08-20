package com.demo.services;

import java.util.List;

import com.demo.entities.OrderDetail;

public interface OrderDetailService {

	// NANG
	public OrderDetail save(OrderDetail orderDetail);

	// VIET
	public List<OrderDetail> findAllByOrderId(int orderId);
	
	public int getMostProductId();
	
	public int getMostProductQuantity();
	
	public double getTotalMaxPriceByBrand();
	
	public int getBrandIdByMaxPrice();
	
}
