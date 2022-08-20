package com.demo.services;

import java.util.List;

import com.demo.entities.Photo;

public interface PhotoService {
	public List<Photo> findAll(boolean status);

	public Photo save(Photo photo);
}
