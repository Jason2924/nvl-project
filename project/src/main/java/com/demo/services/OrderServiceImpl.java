package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Order;
import com.demo.entities.Status;
import com.demo.repositories.OrderRepository;

@Service("oderService")
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderRepository orderRepository;

	// NANG
	@Override
	public long max() {
		return orderRepository.max();
	}
	
	@Override
	public List<Order> retrieveAllByAccount(int accountId) {
		return orderRepository.retrieveAllByAccount(accountId);
	}
	
	public List<Order> retrieveOrderPaypalPayment(){
		return orderRepository.retrieveOrderPaypalPayment();
	}

	// VIET
	@Override
	public Iterable<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public List<Order> findAllByStatus(String status) {
		return orderRepository.findAllByStatus(status);
	}

	@Override
	public Order find(int id) {
		return orderRepository.findById(id).get();
	}

	@Override
	public Order save(Order order) {
		return orderRepository.save(order);
	}

	@Override
	public List<Status> getStatuses() {
		List<Status> statuses = new ArrayList<>();
		statuses.add(new Status(0, "All"));
		statuses.add(new Status(1, "Awaiting"));
		statuses.add(new Status(2, "Accepted"));
		statuses.add(new Status(3, "Packed"));
		statuses.add(new Status(4, "Canceled"));
		return statuses;
	}

	@Override
	public Status findStatusById(int id) {
		for (Status status : getStatuses()) {
			if (status.getId() == id) {
				return status;
			}
		}
		return null;
	}

	@Override
	public Status findStatusByName(String name) {
		for (Status status : getStatuses()) {
			if (status.getName().equalsIgnoreCase(name)) {
				return status;
			}
		}
		return null;
	}

	@Override
	public long countTotalOrder() {
		return orderRepository.count();
	}
	
	@Override
	public List<Order> findAllByMonth(int month, int year){
		return orderRepository.findAllByMonth(month, year);
	}
}
