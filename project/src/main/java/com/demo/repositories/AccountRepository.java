package com.demo.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.demo.entities.Account;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {
	// NANG
	@Query("FROM Account WHERE status = 1")
	public List<Account> retrieveAll();

	// VIET
	@Query("FROM Account WHERE status = :status AND role = :role")
	public List<Account> findAll(@Param("status") boolean status, @Param("role") String role);

	@Query("FROM Account WHERE id = :id AND status = :status")
	public Account find(@Param("id") int id, @Param("status") boolean status);

	@Query("FROM Account WHERE username = :username AND status = :status")
	public Account findByUsername(@Param("username") String username, @Param("status") boolean status);

	@Query("SELECT COUNT(id) FROM Account WHERE status = :status")
	public Long countTotalAccount(@Param("status") boolean status);
	
	@Query(value="SELECT a.id FROM account AS a INNER JOIN `order` AS o ON a.id = o.accountId "
			+ "INNER JOIN payment AS p ON p.orderId = o.id WHERE o.status = 'Accepted' "
			+ "GROUP BY a.id ORDER BY SUM(price) DESC LIMIT 1", nativeQuery = true)
	public int getAccountIdByMaxPaymentPrices();
	
	@Query(value="SELECT SUM(p.price) FROM account AS a INNER JOIN `order` AS o ON a.id = o.accountId "
			+ "INNER JOIN payment AS p ON p.orderId = o.id WHERE o.status = 'Accepted' "
			+ "GROUP BY a.id ORDER BY SUM(p.price) DESC LIMIT 1", nativeQuery = true)
	public double getMaxPaymentPrices();
	
	@Query(value="SELECT a.id FROM account AS a INNER JOIN exchange AS e ON a.id = e.accountId "
			+ "INNER JOIN voucher AS v ON v.id = e.voucherId WHERE e.status = 1 "
			+ "GROUP BY a.id ORDER BY SUM(v.point) DESC LIMIT 1", nativeQuery = true)
	public int getAccountIdByMaxVoucher();
	
	@Query(value="SELECT SUM(v.point) FROM account AS a INNER JOIN exchange AS e ON a.id = e.accountId "
			+ "INNER JOIN voucher AS v ON v.id = e.voucherId WHERE e.status = 1 "
			+ "GROUP BY a.id ORDER BY SUM(v.point) DESC LIMIT 1", nativeQuery = true)
	public int getTotalVoucher();
}
