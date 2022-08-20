package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Commend;
import com.demo.entities.Status;
import com.demo.repositories.CommendRepository;

@Service("commendService")
public class CommendServiceImpl implements CommendService {

	@Autowired
	private CommendRepository commendRepository;

	// NANG
	@Override
	public List<Commend> findAllByProduct(int id) {
		return commendRepository.retrieveAllByProduct(id);
	}

	@Override
	public Commend save(Commend commend) {
		return commendRepository.save(commend);
	}

	// VIET
	@Override
	public Iterable<Commend> findAll() {
		return commendRepository.findAll();
	}

	@Override
	public Commend findById(int id) {
		return commendRepository.findById(id).get();
	}

	@Override
	public void delete(Commend commend) {
		commendRepository.delete(commend);
	}

	@Override
	public List<Status> getAllStatus() {
		List<Status> statuses = new ArrayList<>();
		statuses.add(new Status(0, "All"));
		statuses.add(new Status(1, "Not Accepted"));
		statuses.add(new Status(2, "Accepted"));
		return statuses;
	}

	@Override
	public Status findStatusById(int statusId) {
		for (Status status : getAllStatus()) {
			if (status.getId() == statusId) {
				return status;
			}
		}
		return null;
	}

	@Override
	public List<Commend> findAllByStatus(boolean status){
		return commendRepository.findAllByStatus(status);
	}
}
