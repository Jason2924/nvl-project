package com.demo.validations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Account;
import com.demo.models.RegexModel;
import com.demo.services.AccountService;

@Component("accountValidator")
public class AccountValidator implements Validator {
	
	@Autowired
	private AccountService accountService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Account.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegexModel regexModel = new RegexModel();
		Account account = (Account) target;
		for (Account acc : accountService.findAll()) {
			if (account.getUsername().equals(acc.getUsername())) {
				errors.rejectValue("username", "exists");
			}
		}
		if (regexModel.regex("username", account.getUsername())) {
			errors.rejectValue("username", "username");
		}
		if (regexModel.regex("password", account.getPassword())) {
			errors.rejectValue("password", "password");
		}
		if (regexModel.regex("fullName", account.getFullName())) {
			errors.rejectValue("fullName", "fullName");
		}
		if (regexModel.regex("phone", account.getPhone())) {
			errors.rejectValue("phone", "phone");
		}
		if (regexModel.regex("email", account.getEmail())) {
			errors.rejectValue("email", "email");
		}
	}
	
	public void updateValidate(Object target, Errors errors) {
		RegexModel regexModel = new RegexModel();
		Account account = (Account) target;
		if (!account.getPassword().equals("")) {
			if (regexModel.regex("password", account.getPassword())) {
				errors.rejectValue("password", "password");
			}
		}
		if (regexModel.regex("fullName", account.getFullName())) {
			errors.rejectValue("fullName", "fullName");
		}
		if (regexModel.regex("phone", account.getPhone())) {
			errors.rejectValue("phone", "phone");
		}
		if (regexModel.regex("email", account.getEmail())) {
			errors.rejectValue("email", "email");
		}
	}
	
}
