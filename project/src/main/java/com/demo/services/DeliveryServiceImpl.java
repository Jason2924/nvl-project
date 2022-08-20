package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Delivery;
import com.demo.entities.Status;
import com.demo.repositories.DeliveryRepository;

@Service("deliveryService")
public class DeliveryServiceImpl implements DeliveryService {
	@Autowired
	private DeliveryRepository deliveryRepository;

	// NANG
	@Override
	public Delivery save(Delivery delivery) {
		return deliveryRepository.save(delivery);
	}

	// VIET
	@Override
	public Iterable<Delivery> findAll() {
		return deliveryRepository.findAll();
	}

	@Override
	public List<Delivery> findAllByStatus(String status) {
		return deliveryRepository.findAllByStatus(status);
	}

	@Override
	public Delivery findById(int deliveryId) {
		return deliveryRepository.findByOrderId(deliveryId);
	}

	@Override
	public List<Status> getStatuses() {
		List<Status> statuses = new ArrayList<>();
		statuses.add(new Status(0, "All"));
		statuses.add(new Status(1, "Scheduling"));
		statuses.add(new Status(2, "Delivering"));
		statuses.add(new Status(3, "Received"));
		statuses.add(new Status(5, "Canceled"));
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
	public Delivery findByOrderId(int orderId) {
		return deliveryRepository.findByOrderId(orderId);
	}

}
