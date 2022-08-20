package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Voucher;
import com.demo.repositories.VoucherRepository;

@Service("voucherService")
public class VoucherServiceImp implements VoucherService {

	@Autowired
	private VoucherRepository voucherRepository;

	// NANG
	@Override
	public List<Voucher> retrieveAllByPoint(int point) {
		return voucherRepository.retrieveAllByPoint(point);
	}

	@Override
	public Voucher findById(int id) {
		return voucherRepository.findById(id).get();
	}

	// VIET
	@Override
	public List<Voucher> findAll(boolean status) {
		return voucherRepository.findAll(status);
	}

	@Override
	public Voucher save(Voucher voucher) {
		return voucherRepository.save(voucher);
	}
}
