package com.demo.controllers.user;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.MailService;

@Controller
@RequestMapping("forgotpassword")
public class ForgotPasswordController {
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index() {
		return "user.forgotpassword.index";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String index(@RequestParam("username") String username, ModelMap modelMap) {
		try {
			for (Account account : accountService.retrieveAll()) {
				if (account.getUsername().equals(username)) {
					if (!account.getRole().equalsIgnoreCase("ROLE_ADMIN")) {
						String password = randomString(8);
						String content = "Your password has update : " + password +"<br/>"
								+ "Notice : Please change your password after you login success!";
						account.setPassword(new BCryptPasswordEncoder().encode(password));
						accountService.save(account);
						mailService.sendMail("nvlteam123@gmail.com", account.getEmail(), "NVLTech", content);
						modelMap.put("msg", "Your password has sent to your email!");
						return "user.forgotpassword.index";
					}
					break;
				}
			}
			modelMap.put("err", "User Name does not exist!");
		} catch (Exception e) {
			System.err.println("ForgotPasswordController - index :\n" + e.getMessage());
			modelMap.put("err", "Somethings went wrong, please try again later!");
		}
		return "user.forgotpassword.index";
	}
	
	private String randomString(int length) {
		SecureRandom random = new SecureRandom();
		StringBuilder result = new StringBuilder(length);
		String lowercase = "abcdefghijklmnopqrstuvwxyz";
		String uppercase = lowercase.toUpperCase();
		String number = "0123456789";
		String forRandom = lowercase + uppercase + number;
		for (int i = 0; i < length; i++) {
			int charAt = random.nextInt(forRandom.length());
			char character = forRandom.charAt(charAt);
			result.append(character);
		}
		return result.toString();
	}
	
}