package com.demo.repositories;

import java.util.List;

import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface ProductNativeRepository<Product> {
	List<Object[]> findForAjax(String columns, String condition);
}
