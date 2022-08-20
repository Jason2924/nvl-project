package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Category;
import com.demo.entities.Product;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {
	// NANG
	@Query("FROM Product WHERE status = 1")
	public List<Product> retrieveAll();

	@Query("FROM Product WHERE category.id = :id AND status = 1")
	public List<Product> retrieveAllByCategory(@Param("id") int id);

	@Query("FROM Product WHERE brand.id = :id AND status = 1")
	public List<Product> retrieveAllByBrand(@Param("id") int id);
	
	@Query("FROM Product WHERE name LIKE %:keyword% AND status = 1")
	public List<Product> retrieveAllByKeyword(@Param("keyword") String keyword);
	
	@Query("FROM Product WHERE name LIKE %:keyword% AND status = 1 AND category.id = :categoryId")
	public List<Product> retrieveAllByKeywordCate(@Param("keyword") String keyword, @Param("categoryId") int categoryId);
	
	@Query("FROM Product WHERE status = 1 AND rate BETWEEN 3 AND 5 ORDER BY rate desc")
	public List<Product> retrieveAllByRate();

	// VIET
	@Query("FROM Product WHERE status = :status")
	public List<Product> findAll(@Param("status") boolean status);

	@Query("FROM Product WHERE category = :category AND status = :status")
	public List<Product> findByCategory(@Param("category") Category category, @Param("status") boolean status);

	@Query(value = "SELECT MAX(id) FROM product", nativeQuery = true)
	public int findMaxId();
	
	@Query("SELECT COUNT(id) FROM Product WHERE status = :status")
	public Long countTotalProduct(@Param("status") boolean status);

}
