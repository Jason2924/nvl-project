package com.demo.controllers.user;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.models.RegexModel;
import com.demo.services.AccountService;
import com.demo.validations.AccountValidator;

@Controller
@RequestMapping("register")
public class RegisterController {

	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountValidator accountValidator;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		Account account = new Account();
		modelMap.put("account", account);
		return "user.register.index";
	}

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String index(@ModelAttribute("account") @Valid Account account, BindingResult bindingResult, @RequestParam("confirm") String confirm,
			ModelMap modelMap) {
		try {
			accountValidator.validate(account, bindingResult);
			if (bindingResult.hasErrors()) {
				return "user.register.index";
			} else {
				if (!account.getPassword().equals(confirm)) {
					modelMap.put("confirmerror", "Password and Confirm Password did not match");
					return "user.register.index";
				} else {
					account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
					account.setRole("ROLE_MEMBER");
					account.setCreditPoint(0);
					account.setStatus(true);
					if (accountService.save(account) != null) {
						modelMap.put("msg", "Your account has created successful!");
						return "user.register.index";
					} else {
						return "user.register.index";
					}
				}
			}
			 
		} catch (Exception e) {
			System.err.println("RegisterController - create :\n" + e.getMessage());
			return "user.register.index";
		}
	}

}