package com.demo.services;

import java.util.List;

import com.demo.entities.New;

public interface NewService {
	// VIET
	public List<New> findAll(boolean status);
}
