package com.demo.services;

import com.demo.entities.Payment;

public interface PaymentService {
	
	// NANG
	public Payment retrieveById(int id);
	
	public Payment save(Payment payment);

	// VIET
	public Payment findByOrderId(int orderId);
}
