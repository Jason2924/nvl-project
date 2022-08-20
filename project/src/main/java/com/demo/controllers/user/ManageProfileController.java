package com.demo.controllers.user;

import javax.servlet.http.HttpSession;
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
import com.demo.services.AccountService;
import com.demo.validations.AccountValidator;

@Controller
@RequestMapping("manageprofile")
public class ManageProfileController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private AccountValidator accountValidator;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {
		try {
			Account account = (Account) session.getAttribute("account");
			modelMap.put("account", account);
		} catch (Exception e) {
			System.err.println("ManageProfileController - index :\n" + e.getMessage());
		}
		return "user.manageprofile.index";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String update(@ModelAttribute("account")@Valid Account account, BindingResult bindingResult,
			@RequestParam("confirm") String confirm, ModelMap modelMap, HttpSession session) {
		try {
			System.err.println(account.getUsername());
			accountValidator.updateValidate(account, bindingResult);
			if (bindingResult.hasErrors()) {
				return "user.manageprofile.index";
			} else {
				Account acc = accountService.find(account.getId());
				if (account.getPassword().isEmpty()) {
					account.setPassword(acc.getPassword());
				} else {
					if (!account.getPassword().equals(confirm)) {
						modelMap.put("confirmerror", "Password and Confirm Password did not match");
						return "user.manageprofile.index";
					} else {
						account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
					}
				}
				account.setRole(acc.getRole());
				account.setCreditPoint(acc.getCreditPoint());
				account.setStatus(acc.isStatus());
				accountService.save(account);
				return "redirect:/home";
			}
		} catch (Exception e) {
			System.err.println("ManageProfileController - update :\n" + e.getMessage());
		}
		return "user.manageprofile.index";
	}
	
}
