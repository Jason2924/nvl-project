package com.demo.services;

import java.util.List;

import com.demo.entities.Delivery;
import com.demo.entities.Status;

public interface DeliveryService {
	// NANG
	public Delivery save(Delivery delivery);

	// VIET
	public Iterable<Delivery> findAll();

	public List<Delivery> findAllByStatus(String status);

	public Delivery findById(int deliveryId);

	public List<Status> getStatuses();

	public Status findStatusById(int id);

	public Status findStatusByName(String name);

	public Delivery findByOrderId(int orderId);

}
