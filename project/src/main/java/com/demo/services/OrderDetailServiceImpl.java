package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.OrderDetail;
import com.demo.repositories.OrderDetailRepository;

@Service("orderDetailServiceImp")
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	private OrderDetailRepository orderDetailRepository;

	// NANG
	@Override
	public OrderDetail save(OrderDetail orderDetail) {
		return orderDetailRepository.save(orderDetail);
	}

	// VIET
	@Override
	public List<OrderDetail> findAllByOrderId(int orderId) {
		return orderDetailRepository.findAllByOrderId(orderId);
	}

	@Override
	public int getMostProductId() {
		return orderDetailRepository.getMostProductId();
	}

	@Override
	public int getMostProductQuantity() {
		return orderDetailRepository.getMostProductQuantity();
	}

	@Override
	public double getTotalMaxPriceByBrand() {
		return orderDetailRepository.getTotalMaxPriceByBrand();
	}

	@Override
	public int getBrandIdByMaxPrice() {
		return orderDetailRepository.getBrandIdByMaxPrice();
	}

}
