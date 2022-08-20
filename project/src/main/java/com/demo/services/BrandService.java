package com.demo.services;

import java.util.List;

import com.demo.entities.Brand;

public interface BrandService {
	// NANG
	public Iterable<Brand> findAll();

	// VIET
	public List<Brand> findAll(boolean status);

	public Brand findById(int id);

	public Brand save(Brand brand);

}
