package com.demo.services;

import java.util.List;

import com.demo.entities.Category;
import com.demo.entities.Product;

public interface ProductService {
	// NANG
//	public Iterable<Product> findAll();

	public Product findById(int id);

	public List<Product> retrieveAllByKeyword(String keyword);

	public List<Product> retrieveAllByKeywordCate(String keyword, int categoryId);

	public List<Product> retrieveAllByRate();

//	doi ten tranh trung voi viet
	public List<Product> retrieveAll();

	public List<Product> findAllByCategory(int id);

	public List<Product> findAllByBrand(int id);

	// VIET
	public Iterable<Product> findAll();

	public List<Product> findAll(boolean status);

	public List<Product> findByCategory(Category category, boolean status);

	public Product save(Product product);

	public int findMaxId();

	public List<Product> findForAjax(int productId, int productStatus);

	public long countTotalProduct(boolean status);
}
