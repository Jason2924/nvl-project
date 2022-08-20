package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Brand;

@Repository("branchRepository")
public interface BrandRepository extends CrudRepository<Brand, Integer> {
	// VIET
	@Query("FROM Brand WHERE status = :status")
	public List<Brand> findAll(@Param("status") boolean status);
}
