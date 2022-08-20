package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Photo;

@Repository("photoRepository")
public interface PhotoRepository extends CrudRepository<Photo, Integer> {
	// VIET
	@Query("FROM Photo WHERE status = :status")
	List<Photo> findAll(@Param("status") boolean status);
}
