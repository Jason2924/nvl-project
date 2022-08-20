package com.demo.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.demo.entities.Account;
import com.demo.repositories.AccountRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountRepository accountRepository;

	// security
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountRepository.findByUsername(username, true);
		if (account == null) {
			throw new UsernameNotFoundException("Username not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		String role = account.getRole();
		if (role.equalsIgnoreCase("ROLE_ADMIN")) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return new User(account.getUsername(), account.getPassword(), authorities);
	}

	// NANG
	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Account save(Account account) {
		return accountRepository.save(account);
	}

	@Override
	public List<Account> retrieveAll() {
		return accountRepository.retrieveAll();
	}

	// VIET
	@Override
	public List<Account> findAll(boolean status, String role) {
		return accountRepository.findAll(status, role);
	}

	@Override
	public Account find(int id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public Account findByUsername(String username, boolean status) {
		return accountRepository.findByUsername(username, status);
	}

	@Override
	public long countTotalAccount(boolean status) {
		return accountRepository.countTotalAccount(status);
	}
	
	@Override
	public int getAccountIdByMaxPaymentPrices() {
		return accountRepository.getAccountIdByMaxPaymentPrices();
	}
	
	@Override
	public double getMaxPaymentPrices() {
		return accountRepository.getMaxPaymentPrices();
	}

	@Override
	public int getAccountIdByMaxVoucher() {
		return accountRepository.getAccountIdByMaxVoucher();
	}

	@Override
	public int getTotalVoucher() {
		return accountRepository.getTotalVoucher();
	}
	
}
