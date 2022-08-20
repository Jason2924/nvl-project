package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Account;
import com.demo.entities.Delivery;
import com.demo.entities.Exchange;
import com.demo.entities.Order;
import com.demo.entities.Payment;
import com.demo.entities.Voucher;
import com.demo.services.AccountService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "admin/account")
public class AdminAccountController {
	@Autowired
	private AccountService accountService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("accounts", accountService.findAll(true,"ROLE_MEMBER"));
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.account.index";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("accountId") int accountId) {
		try {
			Account account = accountService.find(accountId);
			// set account
			Account accountTemp = new Account();
			accountTemp.setId(account.getId());
			accountTemp.setFullName(account.getFullName());
			accountTemp.setPhone(account.getPhone());
			accountTemp.setEmail(account.getEmail());
			accountTemp.setAddress(account.getAddress());
			accountTemp.setUsername(account.getUsername());
			// set orders
			List<Order> orders = new ArrayList<>();
			List<Exchange> exchanges = new ArrayList<>();
			for (Order order : account.getOrders()) {
				Order orderTemp = new Order();
				orderTemp.setCode(order.getCode());
				orderTemp.setCreatedDate(order.getCreatedDate());
				orderTemp.setStatus(order.getStatus());
				// set payment
				for (Payment payment : order.getPayments()) {
					Payment paymentTemp = new Payment();
					paymentTemp.setMethod(payment.getMethod());
					orderTemp.getPayments().add(paymentTemp);
				}
				// set delivery
				for (Delivery delivery : order.getDeliveries()) {
					Delivery deliveryTemp = new Delivery();
					deliveryTemp.setStatus(delivery.getStatus());
					orderTemp.getDeliveries().add(deliveryTemp);
				}
				orders.add(orderTemp);
				// set exchanges
				for (Exchange exchange : order.getExchanges()) {
					Exchange exchangeTemp = new Exchange();
					exchangeTemp.setOrder(orderTemp);
					Voucher voucher = new Voucher();
					voucher.setPrice(exchange.getVoucher().getPrice());
					exchangeTemp.setVoucher(voucher);
					exchangeTemp.setPoint(exchange.getPoint());
					exchangeTemp.setCreatedDate(exchange.getCreatedDate());
					exchanges.add(exchangeTemp);
				}
			}
			HashMap<String, Object> hashMap = new HashMap<>();
			hashMap.put("account", accountTemp);
			hashMap.put("orders", orders);
			hashMap.put("exchanges", exchanges);
			return new Gson().toJson(hashMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("account") Account temp) {
		try {
			Account account = accountService.find(temp.getId());
			account.setFullName(temp.getFullName());
			account.setPhone(temp.getPhone());
			account.setEmail(temp.getEmail());
			account.setAddress(temp.getAddress());
			accountService.save(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Account account = accountService.find(id);
			account.setStatus(false);
			accountService.save(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxAccountSort", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxAccountSort(@RequestBody List<AccountJson> accountJsons, @RequestParam("header") String header,
			@RequestParam("turn") String turn) {
		try {
			switch (header) {
			case "thName":
				if (turn.equals("0")) {
					Collections.sort(accountJsons, new AccountNameSort());
				} else {
					Collections.sort(accountJsons, new AccountNameSort().reversed());
				}
				break;
			case "thPhone":
				if (turn.equals("0")) {
					Collections.sort(accountJsons, new AccountPhoneSort());
				} else {
					Collections.sort(accountJsons, new AccountPhoneSort().reversed());
				}
				break;
			case "thEmail":
				if (turn.equals("0")) {
					Collections.sort(accountJsons, new AccountEmailSort());
				} else {
					Collections.sort(accountJsons, new AccountEmailSort().reversed());
				}
				break;
			case "thAddress":
				if (turn.equals("0")) {
					Collections.sort(accountJsons, new AccountAddressSort());
				} else {
					Collections.sort(accountJsons, new AccountAddressSort().reversed());
				}
				break;
			case "thPoint":
				if (turn.equals("0")) {
					Collections.sort(accountJsons, new AccountCreditPointSort());
				} else {
					Collections.sort(accountJsons, new AccountCreditPointSort().reversed());
				}
				break;
			}
			return new Gson().toJson(accountJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}

// temp class to store needed data
class AccountJson implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String fullName;
	private String phone;
	private String email;
	private String address;
	private int creditPoint;

	public AccountJson(int id, String fullName, String phone, String email, String address, int creditPoint) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.creditPoint = creditPoint;
	}

	public AccountJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getCreditPoint() {
		return creditPoint;
	}

	public void setCreditPoint(int creditPoint) {
		this.creditPoint = creditPoint;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

//comparing classes
class AccountNameSort implements Comparator<AccountJson> {

	@Override
	public int compare(AccountJson accountJson1, AccountJson accountJson2) {
		return accountJson1.getFullName().compareTo(accountJson2.getFullName());
	}

}

class AccountPhoneSort implements Comparator<AccountJson> {

	@Override
	public int compare(AccountJson accountJson1, AccountJson accountJson2) {
		return accountJson1.getPhone().compareTo(accountJson2.getPhone());
	}

}

class AccountEmailSort implements Comparator<AccountJson> {

	@Override
	public int compare(AccountJson accountJson1, AccountJson accountJson2) {
		return accountJson1.getEmail().compareTo(accountJson2.getEmail());
	}

}

class AccountAddressSort implements Comparator<AccountJson> {

	@Override
	public int compare(AccountJson accountJson1, AccountJson accountJson2) {
		return accountJson1.getAddress().compareTo(accountJson2.getAddress());
	}

}

class AccountCreditPointSort implements Comparator<AccountJson> {

	@Override
	public int compare(AccountJson accountJson1, AccountJson accountJson2) {
		if (accountJson1.getCreditPoint() > accountJson2.getCreditPoint()) {
			return -1;
		} else if (accountJson1.getCreditPoint() == accountJson2.getCreditPoint()) {
			return 0;
		} else {
			return 1;
		}
	}

}
