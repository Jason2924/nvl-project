package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.New;
import com.demo.repositories.NewRepository;

@Service("newService")
public class NewServiceImpl implements NewService {
	@Autowired
	private NewRepository newRepository;

	@Override
	public List<New> findAll(boolean status) {
		return newRepository.findAll(status);
	}

}
