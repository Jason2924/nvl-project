package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Commend;

@Repository("commendRepository")
public interface CommendRepository extends CrudRepository<Commend, Integer> {
	// NANG
	@Query("FROM Commend WHERE product.id = :id AND status = 1")
	public List<Commend> retrieveAllByProduct(@Param("id") int id);

	// VIET
	@Query("FROM Commend WHERE status = :status")
	public List<Commend> findAllByStatus(@Param("status") boolean status);
}
