package com.demo.services;

import java.util.List;

import com.demo.entities.Voucher;

public interface VoucherService {

	// NANG
	public List<Voucher> retrieveAllByPoint(int point);

	public Voucher findById(int id);

	// VIET
	public List<Voucher> findAll(boolean status);

	public Voucher save(Voucher voucher);

}
