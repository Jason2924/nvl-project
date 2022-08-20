package com.demo.controllers.admin;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Account;
import com.demo.services.AccountService;
import com.demo.services.MailService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "login/admin")
public class AdminLoginController {

	@Autowired
	AccountService accountService;

	@Autowired
	private MailService mailService;

	// login method
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, ModelMap modelMap) {
		try {
			if (error != null) {
				modelMap.put("message", "Failed!");
			}
			if (logout != null) {
				modelMap.put("message", "Bye Bye!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login.admin.index";
	}

	// update method
	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam(value = "username") String username) {
		try {
			Account account = accountService.findByUsername(username, true);
			Account temp = new Account();
			temp.setId(account.getId());
			temp.setFullName(account.getFullName());
			temp.setPhone(account.getPhone());
			temp.setEmail(account.getEmail());
			temp.setAddress(account.getAddress());
			return new Gson().toJson(temp);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("account") Account temp) {
		try {
			Account account = accountService.find(temp.getId());
			if (!temp.getFullName().isEmpty()) {
				account.setFullName(temp.getFullName());
			}
			if (!temp.getPhone().isEmpty()) {
				account.setPhone(temp.getPhone());
			}
			if (!temp.getEmail().isEmpty()) {
				account.setEmail(temp.getEmail());
			}
			if (!temp.getAddress().isEmpty()) {
				account.setAddress(temp.getAddress());
			}
			if (!temp.getPassword().isEmpty()) {
				String[] passwords = temp.getPassword().split(",");
				if (passwords[0].equalsIgnoreCase(passwords[1])) {
					account.setPassword(new BCryptPasswordEncoder().encode(passwords[0]));
				}
			}
			accountService.save(account);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login.admin.index";
	}

	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		try {

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login.admin.accessDenied";
	}

	@RequestMapping(value = "resetPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam("keyword") String keyword, ModelMap modelMap) {
		try {
			for (Account account : accountService.findAll(true, "ROLE_ADMIN")) {
				if (account.getUsername().equals(keyword) || account.getEmail().equals(keyword)) {
					String password = randomString(8);
					account.setPassword(new BCryptPasswordEncoder().encode(password));
					accountService.save(account);
					String content = "Your password has update : " + password + "<br/>"
							+ "Notice : Please change your password after you login success!";
					mailService.sendMail("nvlteam123@gmail.com", account.getEmail(), "NVLTech", content);
					modelMap.put("message", "Your password has sent to your email!");
				} else {
					modelMap.put("message", "Username or email doesn't exist!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login.admin.index";
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
