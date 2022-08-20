package com.demo.controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Contact;
import com.demo.services.MailService;

@Controller
@RequestMapping("contact")
public class ContactController {
	
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("contact", new Contact());
		return "user.contact.index";
	}
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.POST)
	public String send(@ModelAttribute Contact contact, ModelMap modelMap) {
		try {
			String content = "";
			content += "Name : " + contact.getName() + "<br/>";
			content += "Email : " + contact.getEmail() + "<br/>";
			content += "Phone : " + contact.getPhone() + "<br/>";
			content += "Content : <br/>" + contact.getContent();
			mailService.sendMail(contact.getEmail(), "nvlteam123@gmail.com", contact.getName(), content);
			modelMap.put("contact", new Contact());
			modelMap.put("msg", "Your requirement has sent!");
		} catch (Exception e) {
			modelMap.put("err", "Something went wrong, please try again later!");
			System.err.println("ContactController - send :\n" + e.getMessage());
		}
		return "user.contact.index";
	}
	
}
