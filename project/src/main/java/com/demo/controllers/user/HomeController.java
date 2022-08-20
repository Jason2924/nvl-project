package com.demo.controllers.user;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.Delivery;
import com.demo.entities.Order;
import com.demo.entities.Payment;
import com.demo.services.AccountService;
import com.demo.services.CategoryService;
import com.demo.services.OrderService;
import com.demo.services.ProductService;
import com.demo.services.PromotionService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@Controller
@RequestMapping(value = { "", "home" })
public class HomeController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private PromotionService promotionService;
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {
		try {
			Account account = (Account) session.getAttribute("account");
			if (account != null) {
				int accountId = account.getId();
				session.removeAttribute("account");
				session.setAttribute("account", accountService.find(accountId));
			}
			modelMap.put("categoryList", categoryService.findAll());
			modelMap.put("productRateList", productService.retrieveAllByRate());
			modelMap.put("promotionList", promotionService.retrieveByDate(new Date()));
		} catch (Exception e) {
			System.err.println("HomeController - index :\n" + e.getMessage());
		}
		return "user.home.index";
	}

	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signout(HttpSession session) {
		session.removeAttribute("account");
		return "redirect:";
	}

	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(HttpSession session, HttpServletResponse response) {
		try {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
			Account account = (Account) session.getAttribute("account");
			JsonArray array = new JsonArray();
			for (Order order : orderService.retrieveAllByAccount(account.getId())) {
				JsonObject object = new JsonObject();
				object.addProperty("code", order.getCode());
				object.addProperty("status", order.getStatus());
				for (Payment payment : order.getPayments()) {
					object.addProperty("price", payment.getPrice());
				}
				for (Delivery delivery : order.getDeliveries()) {
					object.addProperty("destination", delivery.getDestination());
				}
				object.addProperty("createdDate", simpleDateFormat.format(order.getCreatedDate()));
				array.add(object);
			}
			PrintWriter printWriter = response.getWriter();
			printWriter.print(array);
			printWriter.flush();
			printWriter.close();
		} catch (Exception e) {
			System.err.println("HomeController - history :\n" + e.getStackTrace());
		}
		return null;
	}

}
