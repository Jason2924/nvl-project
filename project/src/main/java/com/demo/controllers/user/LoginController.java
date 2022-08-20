package com.demo.controllers.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.repositories.AccountRepository;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index() {
		return "user.login.index";
	}
	
	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public String signin(@RequestParam("username") String username, 
			@RequestParam("password") String password, 
			HttpSession session, ModelMap modelMap) {
		List<Account> accountList = accountRepository.retrieveAll();
		for (Account account : accountList) {
			if (username.equals(account.getUsername())) {
				if (new BCryptPasswordEncoder().matches(password, account.getPassword())) {
					if (!account.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
						session.removeAttribute("account");
						session.setAttribute("account", account);
						return "redirect:/home";
					} else {
						modelMap.put("err", "Your account can not log in this page");
						return "user.login.index";
					}
				} else {
					modelMap.put("err", "Password incorrect");
					return "user.login.index";
				}
			}
		}
		modelMap.put("err", "User Name does not exist");
		return "user.login.index";
	}
	
}