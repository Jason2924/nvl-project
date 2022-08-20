package com.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Payment;
import com.demo.repositories.PaymentRepository;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentRepository paymentRepository;

	// NANG
	@Override
	public Payment retrieveById(int id) {
		return paymentRepository.retrieveById(id);
	}

	@Override
	public Payment save(Payment payment) {
		return paymentRepository.save(payment);
	}

	// VIET
	@Override
	public Payment findByOrderId(int orderId) {
		return paymentRepository.findByOrderId(orderId);
	}

}
