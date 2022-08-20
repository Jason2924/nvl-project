package com.demo.repositories;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.demo.entities.Product;

@Repository("productNativeRepository")
public class ProductNativeRepositoryImpl implements ProductNativeRepository<Product> {
	@PersistenceContext
	private EntityManager entityManager;

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findForAjax(String columns, String condition) {
		String queryString = "SELECT " + columns + " FROM product WHERE " + condition + ";";
		System.err.println(queryString);
		Query query = entityManager.createNativeQuery(queryString);
		return query.getResultList();
	}

}
