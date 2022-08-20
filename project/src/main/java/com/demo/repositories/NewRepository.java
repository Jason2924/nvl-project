package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.New;

@Repository("newRepository")
public interface NewRepository extends CrudRepository<New, Integer> {
	@Query("FROM New WHERE status = :status")
	public List<New> findAll(@Param("status") boolean status);
}
