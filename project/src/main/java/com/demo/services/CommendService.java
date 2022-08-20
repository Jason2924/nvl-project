package com.demo.services;

import java.util.List;

import com.demo.entities.Commend;
import com.demo.entities.Status;

public interface CommendService {
	// NANG
	List<Commend> findAllByProduct(int id);

	public Commend save(Commend commend);

	// VIET
	public Iterable<Commend> findAll();

	public Commend findById(int id);

	public void delete(Commend commend);

	public List<Status> getAllStatus();
	
	public Status findStatusById(int statusId);
	
	public List<Commend> findAllByStatus(boolean status);

}
