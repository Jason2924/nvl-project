package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Category;
import com.demo.entities.Product;
import com.demo.repositories.ProductNativeRepository;
import com.demo.repositories.ProductRepository;

@Service("productService")
public class ProductServiceImp implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private ProductNativeRepository<?> productNativeRepository;

	// NANG
	@Override
	public List<Product> retrieveAll() {
		return productRepository.retrieveAll();
	}

	@Override
	public Product findById(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public List<Product> findAllByCategory(int id) {
		return productRepository.retrieveAllByCategory(id);
	}

	@Override
	public List<Product> findAllByBrand(int id) {
		return productRepository.retrieveAllByBrand(id);
	}

	@Override
	public List<Product> retrieveAllByKeyword(String keyword) {
		return productRepository.retrieveAllByKeyword(keyword);
	}

	@Override
	public List<Product> retrieveAllByKeywordCate(String keyword, int categoryId) {
		return productRepository.retrieveAllByKeywordCate(keyword, categoryId);
	}

	@Override
	public List<Product> retrieveAllByRate() {
		return productRepository.retrieveAllByRate();
	}

	/*
	 * @Override public List<Product> retrieveAllOrderBy(String sort) { return
	 * productRepository.retrieveAllOrderBy(sort); }
	 */

	// VIET
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public List<Product> findAll(boolean status) {
		return productRepository.findAll(status);
	}

	@Override
	public List<Product> findByCategory(Category category, boolean status) {
		return productRepository.findByCategory(category, status);
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public int findMaxId() {
		try {
			return productRepository.findMaxId();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Product> findForAjax(int productId, int productStatus) {
		List<Product> products = new ArrayList<>();
		String columns = "id, name, quantity, description, configuration, rate, status";
		String condition = "product.id = " + productId + " AND product.status = " + productStatus;
		List<Object[]> rows = productNativeRepository.findForAjax(columns, condition);
		for (Object[] row : rows) {
			Product product = new Product();
			product.setId(Integer.parseInt(row[0].toString()));
			product.setName(row[1].toString());
			product.setQuantity(Integer.parseInt(row[2].toString()));
			product.setDescription(row[3].toString());
			product.setConfiguration(row[4].toString());
			products.add(product);
		}
		return products;
	}
	
	@Override
	public long countTotalProduct(boolean status) {
		return productRepository.countTotalProduct(status);
	}

}
