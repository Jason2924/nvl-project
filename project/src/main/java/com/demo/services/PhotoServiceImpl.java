package com.demo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.entities.Photo;
import com.demo.repositories.PhotoRepository;

@Service("photoService")
public class PhotoServiceImpl implements PhotoService {
	@Autowired
	private PhotoRepository photoRepository;

	@Override
	public List<Photo> findAll(boolean status) {
		return photoRepository.findAll(status);
	}

	@Override
	public Photo save(Photo photo) {
		return photoRepository.save(photo);
	}
}
