package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Brand;
import com.demo.repositories.BrandRepository;

@Service("brandService")
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandRepository brandRepository;

	// NANG
	@Override
	public Iterable<Brand> findAll() {
		return brandRepository.findAll();
	}

	// VIET
	@Override
	public List<Brand> findAll(boolean status) {
		return brandRepository.findAll(status);
	}

	@Override
	public Brand findById(int id) {
		return brandRepository.findById(id).get();
	}

	@Override
	public Brand save(Brand brand) {
		return brandRepository.save(brand);
	}

}
