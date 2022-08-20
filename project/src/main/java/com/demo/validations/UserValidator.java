package com.demo.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.demo.entities.Customer;
import com.demo.models.RegexModel;

@Component("userValidator")
public class UserValidator implements Validator {
	
	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Customer.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		RegexModel regexModel = new RegexModel();
		Customer customer = (Customer) target;
		if (regexModel.regex("fullName", customer.getName())) {
			errors.rejectValue("name", "fullName");
		}
		if (regexModel.regex("phone", customer.getPhone())) {
			errors.rejectValue("phone", "phone");
		}
		if (regexModel.regex("email", customer.getEmail())) {
			errors.rejectValue("email", "email");
		}
	}
}
