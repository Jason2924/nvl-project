package com.demo.services;

import java.util.List;

import com.demo.entities.Category;

public interface CategoryService {
	// VIET
	public Iterable<Category> findAll();

	public List<Category> findAll(boolean status);

	public Category findById(int id);

	public Category save(Category category);
}
