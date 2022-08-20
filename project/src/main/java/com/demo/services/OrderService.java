package com.demo.services;

import java.util.List;

import com.demo.entities.Order;
import com.demo.entities.Status;

public interface OrderService {
	// NANG
	public long max();
	
	public List<Order> retrieveAllByAccount(int accountId);
	
	public List<Order> retrieveOrderPaypalPayment();
	
	// VIET
	public Iterable<Order> findAll();

	public List<Order> findAllByStatus(String status);

	public Order find(int id);

	public Order save(Order order);

	public List<Status> getStatuses();

	public Status findStatusById(int id);
	
	public Status findStatusByName(String name);
	
	public long countTotalOrder();
	
	public List<Order> findAllByMonth(int month, int year);
}
