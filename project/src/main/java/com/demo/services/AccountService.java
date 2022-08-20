package com.demo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.demo.entities.Account;

public interface AccountService extends UserDetailsService {
	// nang
	public Iterable<Account> findAll();

	public Account save(Account account);

	public List<Account> retrieveAll();

	// viet
	public List<Account> findAll(boolean status, String role);

	public Account find(int id);

	public Account findByUsername(String username, boolean status);

	public long countTotalAccount(boolean status);

	public int getAccountIdByMaxPaymentPrices();

	public double getMaxPaymentPrices();

	public int getAccountIdByMaxVoucher();

	public int getTotalVoucher();

}
